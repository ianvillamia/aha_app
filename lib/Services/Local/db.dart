import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
//first create singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance =
      DatabaseHelper._privateConstructor(); //creates only 1 instance
/*create var for once*/
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;

//initialize db
  static Database _database;
//getter
  Future<Database> get database async {}
}
