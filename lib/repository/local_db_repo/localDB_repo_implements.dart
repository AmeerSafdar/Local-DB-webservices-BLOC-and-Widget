// ignore_for_file: prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, use_rethrow_when_possible, unnecessary_string_interpolations

import 'package:sqflite/sqflite.dart';
import 'package:task8/helper/constants/common_key.dart';
import 'package:task8/model/user_model.dart';
import 'package:task8/repository/local_db_repo/localdb_interface.dart';

class DBHelper extends LocalDBData{
  Database? _db;
  final int _version =1;

@override
Future<void> initDb() async{
    if(_db !=null){
      return ;
    }
    try{
      String _path = await getDatabasesPath() + '${CommonKey.db_name}';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db , version){
          return db.execute(
            """
            ${CommonKey.create_tabel}  ${CommonKey.tableName}
            (
            ${CommonKey.id} ${CommonKey.primaryKey},
            ${CommonKey.first_name} ${CommonKey.dataType_string},
            ${CommonKey.last_name} ${CommonKey.dataType_string},
            ${CommonKey.img} ${CommonKey.dataType_uint8List}
            )
            """
          );
        }
      );
    }
    catch(e){
      throw e;
    }
  }

@override
Future<List<Map<String, dynamic>>> query() async{
    List<Map<String,dynamic>> _users =await _db!.query(CommonKey.tableName);
    return _users;
  }

@override
Future<void> insert(UserData data) async {
     await _db?.insert(
      CommonKey.tableName, data.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
      ) ;
  }
}