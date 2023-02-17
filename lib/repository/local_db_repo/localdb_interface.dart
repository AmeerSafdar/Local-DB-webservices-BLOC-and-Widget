import 'package:task8/model/user_model.dart';

abstract class LocalDBData{
   Future<void> initDb ();
   Future<void> insert(UserData data);
   Future<List<Map<String,dynamic>>> query();
}