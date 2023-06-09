import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'childfoldermodel.dart';
import 'masterfoldermodel.dart';

class ChildFolderDatabase {
  static final ChildFolderDatabase instance = ChildFolderDatabase._init();
  static Database? _database;
  ChildFolderDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('folder.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path,
        version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integer = "INTEGER NOT NULL";
    if (kDebugMode) {
      print("!!!!!CHILD DATABASE TABLE CREATED!!!!!!");
    }
    await db.execute('''
    CREATE TABLE $tablename(
      ${ChildFolderField.childFolderId} $idType,
      ${ChildFolderField.childItemName} $textType,
      ${ChildFolderField.time} $textType,
      ${ChildFolderField.masterFolderId} $integer,
      FOREIGN KEY(${ChildFolderField.masterFolderId}) REFERENCES ${MasterFolderField.masterFolderId}
    )''');
  }

  Future<ChildMedia> create(ChildMedia media) async {
    final db = await instance.database;
    final id = await db.insert(tablename, media.toJson());
    return media.copy(childFolderId: id);
  }

  Future<ChildMedia> readMedia(int id) async {
    final db = await instance.database;

    final maps = await db.query(tablename,
        columns: [],
        where: '${ChildFolderField.childFolderId} = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return ChildMedia.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ChildMedia>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = '${ChildFolderField.time} DESC';
    final result = await db.query(tablename, orderBy: orderBy);
    return result.map((json) => ChildMedia.fromJson(json)).toList();
  }

  Future<int> update(ChildMedia media) async {
    final db = await instance.database;
    return db.update(
      tablename,
      media.toJson(),
      where: '${ChildFolderField.childFolderId} = ?',
      whereArgs: [media.childFolderId],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tablename,
      where: '${ChildFolderField.childFolderId} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
