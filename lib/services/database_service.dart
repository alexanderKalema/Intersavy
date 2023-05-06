import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class DatabaseService {
  Database? _database;


  Database _getDatabaseOrThrow() {
    final db = _database;
    if (db == null) {
      throw  UnimplementedError();
    } else {
      return db;
    }
  }


    Future<List<Map<String,dynamic>>> getScores() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();


    final scores = await db.query(
      scoreTable,
      orderBy: "$trialCountColumn ASC",
    );
       return scores;

  }



  Future<ScoreDatabase> createScore(
      {required String score}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    await db.insert(scoreTable, {
      dateColumn: '${ DateFormat.yMMMMd('en_US').format(DateTime.now())}   ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0') }',
      trialCountColumn: score,
    });

    final mydb = ScoreDatabase(

        date: '${ DateFormat.yMMMMd('en_US').format(DateTime.now())} ${ DateFormat.yMMMMd('en_US').format(DateTime.now())}   ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0') }',
        scoreCount: score
    );
   _database = db;
    return mydb;
  }



  Future<void> close() async {
    final db = _database;
    if (db == null) {
      // throw DatabaseIsNotOpen();
    } else {
      await db.close();
      _database = null;
    }
  }


  Future<void> _ensureDbIsOpen() async {
    try {
    await open();
    }
    catch (e) {
      print(e);
     }
  }

  Future<void> open() async {
    if (_database != null) {
      // throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);

      await db.execute(createScoreTable);
      _database = db;
    } on MissingPlatformDirectoryException {
      //  throw UnableToGetDocumentsDirectory();
    }
  }


}



class ScoreDatabase {

  String scoreCount;
  String date;

  ScoreDatabase({

    required this.scoreCount,
    required this.date,
  });

  static ScoreDatabase fromRow(Map<String, Object?> map){
      return ScoreDatabase(
          scoreCount : map[trialCountColumn] as String,
          date: map[dateColumn] as String
      );
}

  @override
  String toString() => 'Score , date = $date, scoreCount = $scoreCount';

  @override
  int get hashCode => 4;
}


  const dbName = 'score.db';
  const uidColumn = 'uid';
  const trialCountColumn = 'trials_count';
  const dateColumn = 'date';
  const scoreTable = 'score';

  const createScoreTable = '''CREATE TABLE IF NOT EXISTS "score" (
        "uid"	INTEGER NOT NULL ,
        "trials_count"	INTEGER ,
        "date"	TEXT,
         PRIMARY KEY("uid" AUTOINCREMENT)
      );''';


