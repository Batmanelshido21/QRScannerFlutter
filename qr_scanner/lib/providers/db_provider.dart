import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  // ignore: unused_field
  static Database? _dataBase;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get dataBase async {
    if (_dataBase != null) {
      return _dataBase!;
    }
    _dataBase = await initDB();
    return _dataBase!;
  }

  Future<Database> initDB() async {
    //Path de donde almacenaremos la base de datos

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(documentsDirectory.path);
    print(documentsDirectory.absolute);
    print(documentsDirectory.uri);
    print(path);
    print('=================');
    //Creación de la base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor text
          )
      ''');
    });
  }
}
