import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'masterfoldermodel.dart';

class FolderDatabase {
  static final FolderDatabase instance = FolderDatabase._init();
  static Database? _database;

  FolderDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('master.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    if (kDebugMode) {
      print('!!!!!FOLDER DATABASE CREATED !!!!!');
      await db.execute('''
      CREATE TABLE $tableName(
        ${MasterFolderField.masterFolderId} $idType,
        ${MasterFolderField.masterFolderName} $textType,
        ${MasterFolderField.time} $textType,
        ${MasterFolderField.numberOFItems} $textType
      )
''');
    }
  }

  Future<FolderMedia> create(FolderMedia media) async {
    final db = await instance.database;
    final id = await db.insert(tableName, media.toJson());
    return media.copy(masterId: id);
  }

  Future<FolderMedia> readMedia(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      where: '${MasterFolderField.masterFolderId} = ?',
      columns: [],
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FolderMedia.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<FolderMedia>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = '${MasterFolderField.time} DESC';
    final result = await db.query(tableName, orderBy: orderBy);
    return result.map((json) => FolderMedia.fromJson(json)).toList();
  }

  Future<int> update(FolderMedia media) async {
    final db = await instance.database;
    return db.update(
      tableName,
      media.toJson(),
      where: '${MasterFolderField.masterFolderId} = ?',
      whereArgs: [media.masterId],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: '${MasterFolderField.masterFolderId} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
