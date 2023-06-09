import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'databasePdf.dart';
class PdfDatabase {
  static final PdfDatabase instance = PdfDatabase._init();
  static Database? _database;

  PdfDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pdf.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    if (kDebugMode) {
      print("!!!!PDF TABLE CREATED!!!");
    }
    await db.execute('''
    CREATE TABLE $tableName(
      ${PdfFields.id} $idType,
      ${PdfFields.title} $textType,
      ${PdfFields.number} $integerType,
      ${PdfFields.description} $textType,
      ${PdfFields.content} $textType
    )
''');
  }

  Future<Pdf> create(Pdf pdf) async {
    final db = await instance.database;
    final id = await db.insert(tableName, pdf.toJson());
    return pdf.copy(id: id);
  }

  Future<Pdf> readMedia(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableName,
        columns: [], where: '${PdfFields.id}=?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Pdf.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<Pdf>> readAllNotes() async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => Pdf.fromJson(json)).toList();
  }

  Future<int> update(Pdf pdf) async {
    final db = await instance.database;
    return db.update(tableName, pdf.toJson(),
        where: '${PdfFields.id}=?', whereArgs: [pdf.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db
        .delete(tableName, where: '${PdfFields.id}=?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
