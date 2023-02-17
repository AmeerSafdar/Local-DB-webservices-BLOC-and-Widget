
import 'package:flutter/foundation.dart';
import 'package:task8/model/user_model.dart';

abstract class APIData{
  Future<Uint8List> getNetworkImage(String imgPath) ;
  Future<List<UserData>> fetchPosts();
}