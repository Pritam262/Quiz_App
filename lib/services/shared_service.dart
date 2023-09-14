import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';

import '../models/get_request_response.dart';
import '../models/login_user_response_model.dart';

class SharedService{
  static Future<bool> isLoggedIn() async{
   var isKeyExits = await APICacheManager().isAPICacheKeyExist("auth-token");
    return isKeyExits;
  }
  static Future<LoginUserResponseModel?> userDetails() async {
    var isKeyExits = await APICacheManager().isAPICacheKeyExist("auth-token");
    if(isKeyExits){
      var cacheData = await APICacheManager().getCacheData("auth-token");
      return loginResponseJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(LoginUserResponseModel model) async{
    APICacheDBModel cacheDBModel = APICacheDBModel(key: 'auth-token', syncData: jsonEncode(model.token));

    APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async{
    await APICacheManager().deleteCache('auth-token');
    Navigator.pushReplacementNamed(context, '/');
  }
}