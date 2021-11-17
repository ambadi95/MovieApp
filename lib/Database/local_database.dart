import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'movie_details_db.dart';


class DatabaseHelper {

  static String movieDetailTable = 'movieDetailTable';
  static String imdbId = 'ImdbId';
  static String title =  'Title';
  static String year = 'Year';
  static String rated = 'Rated';
  static String released = 'Released';
  static String runtime = 'Runtime';
  static String genre = 'Genre';
  static String director = 'Director';
  static String writer = 'Writer';
  static String actor = 'Actors';
  static String plot = 'Plot';
  static String poster = 'Poster';
  static String metascore = 'Metascore';

  MovieDetailDb product;
  static DatabaseHelper _databaseHelper;
  static Database _database;
  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'DataBase.db';
    // Open/create the database at a given path
    var comicDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return comicDatabase;
  }

   Future _createDb(Database db, int newVersion) async {
    print("Database Create");
    await db.execute(
        'CREATE TABLE $movieDetailTable($imdbId Text,'
            '$title TEXT, $year TEXT, $rated TEXT, $released TEXT,'
            '$runtime TEXT, $genre TEXT, $director TEXT, $writer TEXT, $actor TEXT,'
            '$plot TEXT, $poster TEXT, $metascore TEXT)');

  }

  Future<int> insertDb(
      Map<String, dynamic> _inputDbdata, String _tableName) async {
    Database db = await this.database;
    int resultFromDb = await db.insert(_tableName, _inputDbdata);
    return resultFromDb;
  }

  Future<int> updateDb(String _tableName, Map<String, dynamic> _updateDbdata,
      String _where, List<dynamic> _whereArgs) async {
    Database db = await this.database;
    int resultToUpdate = await db.update(_tableName, _updateDbdata,
        where: _where, whereArgs: _whereArgs);
    return resultToUpdate;
  }

  Future<List<Map<String, dynamic>>> readDb(String _query) async {
    Database db = await this.database;
    var resultToUpdate = await db.rawQuery(_query);
    return resultToUpdate;
  }



}