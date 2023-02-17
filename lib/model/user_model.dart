// ignore_for_file: unnecessary_this, prefer_collection_literals, non_constant_identifier_names

import 'package:flutter/foundation.dart';

class UserData {
  int? id;
  String? first_name;
  String? last_name;
  String? avatar;
  Uint8List? img;

  UserData({this.id,this.first_name, this.last_name,this.img, this.avatar});

  UserData.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    img=json['img'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id']=this.id;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['img']=this.img;
    return data;
  }
}