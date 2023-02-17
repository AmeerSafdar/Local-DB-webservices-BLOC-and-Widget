// ignore_for_file: prefer_final_fields, unused_import

import 'package:dio/dio.dart';
import 'package:task8/helper/constants/const.dart';

class API{
  Dio _dio=dio;

  API(){
  _dio.options.baseUrl=API_URL;
  }

  Dio get sendRequest => _dio;

}