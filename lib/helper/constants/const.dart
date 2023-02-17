// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:task8/repository/local_db_repo/localDB_repo_implements.dart';

const String API_URL='https://reqres.in/api/';
final dio = Dio();
final DBHelper dbHelper=DBHelper();