// ignore_for_file: use_rethrow_when_possible, non_constant_identifier_names, unnecessary_null_comparison, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:task8/helper/constants/common_key.dart';
import 'package:task8/helper/constants/const.dart';
import 'package:task8/model/user_model.dart';
import 'package:task8/repository/api_network/api.dart';
import 'package:task8/repository/api_data_repo/api_data_interface.dart';

class PostRepository extends APIData {
  API _api = API();
  Uint8List? imgs;

@override
Future<List<UserData>> fetchPosts() async {
    try {

      List<Map<String, dynamic>> usersList =await dbHelper.query();

      if ( usersList.isEmpty || usersList==null || usersList==[] ) {

           Response response = await _api.sendRequest.get(CommonKey.user_key);
           List<dynamic> _users = response.data[CommonKey.data_key];
           List<UserData> _usersApi= _users.map((_users) => UserData.fromJson(_users)).toList();
           for (var element in _usersApi) {
              imgs = await getNetworkImage(element.avatar.toString());
              dbHelper.insert(
                UserData(
                  first_name: element.first_name,
                  last_name: element.last_name,
                  img: imgs
                )
                );
            }
           usersList =await dbHelper.query();
      }

    final userData=usersList.map((usersList) => UserData.fromJson(usersList)).toList();
    return userData;
    }

    catch(ex) {
      throw ex;
    }
  }

@override
 Future<Uint8List> getNetworkImage(String imgPath) async {
      Uint8List _base64 = (await NetworkAssetBundle(Uri.parse(imgPath)).load(imgPath))
                          .buffer.asUint8List();
      return _base64;
}

}