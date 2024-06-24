// ignore_for_file: avoid_print, prefer_final_fields, depend_on_referenced_packages, unused_field, unused_import

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  var _userDatabaseName = "fitnessDb";
  var _userTableName = "workoutsTb";
  var _waterTableName = "water";
  var _version = 2;
  late Database database;

  Future<void> open() async {
    try {
      database = await openDatabase(
        _userDatabaseName,
        version: _version,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE $_userTableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            round INTEGER,
            name TEXT,
            videoId TEXT,
            repetitions INTEGER,
            second INTEGER
          )
        ''');
          await db.execute('''
          INSERT INTO $_userTableName (type, round, name, videoId, repetitions, second) 
          VALUES 
            ('Fullbody workout', '1', 'Jumping jacks', 'iSSAk4XCsRA', '15', '30'),
            ('Fullbody workout', '1', 'Tricep dips', 'HCf97NPYeGY', '20', '15'),
            ('Fullbody workout', '1', 'Squats', '4KmY44Xsg2w', '25', '30'),
            ('Fullbody workout', '2', 'Mountain climbers', 'De3Gl-nC7IQ', '15', '30'),
            ('Fullbody workout', '2', 'Modified v-sits', '8yysi-O3Fqc', '20', '15'),
            ('Fullbody workout', '2', 'Push ups with rotation', 'Ohz9RWkCvH0', '20', '30'),
            ('Fullbody workout', '2', 'Up & down planks', 'L4oFJRDAU4Q', '20', '30'),
            ('Lowebody Workout', '1', 'Bottom to heels stretch', 'JqnZK0dijE0', '10', '30'),
            ('Lowebody Workout', '1', 'Opposite arm / leg raises', 'GJ34tTJyWz8', '10', '15'),
            ('Lowebody Workout', '1', 'Back extension', '9ceFn3bH5ls', '10', '30'),
            ('Lowebody Workout', '1', 'Bridges', 'Xp33YgPZgns', '10', '30'),
            ('Lowebody Workout', '1', 'Knee rolls', 'mXdU1CJ-QJI', '10', '30'),
            ('AB Workout', '1', 'Sit-ups', '8Ax9H9VPdm4', '10', '30'),
            ('AB Workout', '1', 'Flutter kicks', 'ZB1SwBRVLCc', '12', '15'),
            ('AB Workout', '1', 'Leg raises', 'PCDxgsX_LFs', '10', '30'),
            ('AB Workout', '2', 'Bicycle crunches', '8Ax9H9VPdm4', '10', '30'),
            ('AB Workout', '2', 'Knee crunches', 'ZB1SwBRVLCc', '10', '15'),
            ('AB Workout', '2', 'Leg pull-ins', 'PCDxgsX_LFs', '10', '30'),
            ('AB Workout', '3', 'Plank arm lifts', 'niry-NU-QmI', '10', '30'),
            ('AB Workout', '3', 'Elbow plank', '0ESIDrFAU-o', '10', '15'),
            ('AB Workout', '3', 'Body saw', 'ZTN2mCuYi2Y', '10', '30'),
            ('Abs training from The Rock', '1', 'Bottom to heels stretch', 'JqnZK0dijE0', '10', '30'),
            ('Abs training from The Rock', '1', 'Flutter kicks', 'ZB1SwBRVLCc', '12', '15'),
            ('Abs training from The Rock', '1', 'Tricep dips', 'HCf97NPYeGY', '20', '15'),
            ('Abs training from The Rock', '1', 'Modified v-sits', '8yysi-O3Fqc', '20', '15'),
            ('Abs training from The Rock', '1', 'Plank arm lifts', 'niry-NU-QmI', '10', '30'),
            ('Press training Brad Pitt', '1', 'Flutter kicks', 'ZB1SwBRVLCc', '12', '15'),
            ('Press training Brad Pitt', '1', 'Leg raises', 'PCDxgsX_LFs', '10', '30'),
            ('Press training Brad Pitt', '1', 'Back extension', '9ceFn3bH5ls', '10', '30'),
            ('Press training Brad Pitt', '1', 'Mountain climbers', 'De3Gl-nC7IQ', '15', '30'),
            ('Press training Brad Pitt', '1', 'Knee rolls', 'mXdU1CJ-QJI', '10', '30'),
            ("Schwarzenegger's Leg Workout", '1', 'Jumping jacks', 'iSSAk4XCsRA', '15', '30'),
            ("Schwarzenegger's Leg Workout", '1', 'Tricep dips', 'HCf97NPYeGY', '20', '15'),
            ("Schwarzenegger's Leg Workout", '1', 'Bottom to heels stretch', 'JqnZK0dijE0', '10', '30'),
            ("Schwarzenegger's Leg Workout", '1', 'Opposite arm / leg raises', 'GJ34tTJyWz8', '10', '15'),
            ("Schwarzenegger's Leg Workout", '1', 'Bicycle crunches', '8Ax9H9VPdm4', '10', '30'),
            ("Vin Diesel's Hand Training", '1', 'Push ups with rotation', 'Ohz9RWkCvH0', '20', '30'),
            ("Vin Diesel's Hand Training", '1', 'Leg pull-ins', 'PCDxgsX_LFs', '10', '30'),
            ("Vin Diesel's Hand Training", '1', 'Plank arm lifts', 'niry-NU-QmI', '10', '30'),
            ("Vin Diesel's Hand Training", '1', 'Elbow plank', '0ESIDrFAU-o', '10', '15'),
            ("Vin Diesel's Hand Training", '1', 'Body saw', 'ZTN2mCuYi2Y', '10', '30'),
            ('Abs workout by Chris Hemsforth', '1', 'Knee crunches', 'ZB1SwBRVLCc', '10', '15'),
            ('Abs workout by Chris Hemsforth', '1', 'Modified v-sits', '8yysi-O3Fqc', '20', '15'),
            ('Abs workout by Chris Hemsforth', '1', 'Push ups with rotation', 'Ohz9RWkCvH0', '20', '30'),
            ('Abs workout by Chris Hemsforth', '1', 'Up & down planks', 'L4oFJRDAU4Q', '20', '30'),
            ('Abs workout by Chris Hemsforth', '1', 'Body saw', 'ZTN2mCuYi2Y', '10', '30')
        ''');
        },
      );
    } catch (e) {
      print("Error opening database: $e");
    }
  }


  Future<List<Map<String, dynamic>>> getListType(String type) async {
    List<Map<String, dynamic>> userMaps = await database.query(_userTableName);
    List<Map<String, dynamic>> filteredList = [];
    for (var userMap in userMaps) {
      if (userMap['type'] == type) {
        filteredList.add(userMap);
      }
    }
    return filteredList;
  }

  Future<List<Map<String, dynamic>>> getList() async {
    List<Map<String, dynamic>> userMaps = await database.query(_userTableName);
    return userMaps;
  }

}
