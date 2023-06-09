import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'databaseModel.dart';

class MediaDatabase {
  static final MediaDatabase instance = MediaDatabase._init();
  static Database? _database;
  MediaDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('media.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path,
        version: 4, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const textType1 = 'TEXT NULL';
    const boolType = "BOOLEAN NOT NULL";
    if (kDebugMode) {
      print("!!!!!!!!!TABLE CREATED!!!!!!!!!!");
    }

    await db.execute('''
    CREATE TABLE $tableName(
      ${MediaFields.id} $idType,
      ${MediaFields.istext} $boolType,
      ${MediaFields.title} $textType,
      ${MediaFields.description} $textType,
      ${MediaFields.mediaFile} $textType,
      ${MediaFields.language} $textType,
      ${MediaFields.time} $textType,
      ${MediaFields.imageBytes} $textType1
    )''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion <= 2) {
      if (kDebugMode) {
        print("!!!!!!!!!Table Upgraded!!!!!!!!");
      }
      db.execute(
          "ALTER TABLE $tableName ADD COLUMN ${MediaFields.language} TEXT");
      db.execute(
          "ALTER TABLE $tableName ADD COLUMN ${MediaFields.imageBytes} TEXT NULL");
    } else {
      if (kDebugMode) {
        print('!!!!!!!!!Image Data Table Upgraded!!!!!!!!');
      }
      db.execute(
          "ALTER TABLE $tableName ADD COLUMN ${MediaFields.imageBytes} TEXT NULL");
    }
  }

  Future<Media> create(Media media) async {
    final db = await instance.database;
    final id = await db.insert(tableName, media.toJson());
    return media.copy(id: id);
  }

  Future<Media> readMedia(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableName,
        columns: [], where: '${MediaFields.id} = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Media.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Media>> readAllNotes() async {
    final db = await instance.database;

    const orderBy = '${MediaFields.time} DESC';

    final result = await db.query(tableName, orderBy: orderBy);

    return result.map((json) => Media.fromJson(json)).toList();
  }

  Future<int> update(Media media) async {
    final db = await instance.database;

    return db.update(
      tableName,
      media.toJson(),
      where: '${MediaFields.id} = ?',
      whereArgs: [media.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableName,
      where: '${MediaFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
