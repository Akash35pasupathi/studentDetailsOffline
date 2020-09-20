import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_details_offline/bloc/ItemModel.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;
  String DB_name="ClassDetails";



  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE "+DB_name+" ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "json_data TEXT"
          ")");
    });
  }

  newClassDetails(ClassDetails newClient) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM "+DB_name+"");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into "+DB_name+" (id,name,json_data)"
        " VALUES (?,?,?)",
        [id, newClient.name,newClient.jsonData]);
    return raw;
  }







  Future<List<ClassDetails>> getAllData() async {
    final db = await database;
    var res = await db.query(""+DB_name+"");
    List<ClassDetails> list =
        res.isNotEmpty ? res.map((c) => ClassDetails.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete(""+DB_name+"", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.delete(""+DB_name+"");
  }
}
