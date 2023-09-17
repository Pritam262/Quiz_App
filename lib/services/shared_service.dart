/*
import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';

import '../models/get_request_response.dart';
import '../models/authentication_response_model.dart';

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
}*/

import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/authentication_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("auth-token");

    return isCacheKeyExist;
  }

  static Future<AuthenticationResponseModel?> loginDetails() async {
    var isCacheKeyExist =
        await APICacheManager().isAPICacheKeyExist("auth-token");

    if (isCacheKeyExist) {
      var cacheData = await APICacheManager().getCacheData("auth-token");
      return authResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(
    AuthenticationResponseModel loginResponse,
  ) async {
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "auth-token",
      syncData: jsonEncode(loginResponse.toJson()),
    );

    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("auth-token");
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/loginpage',
      (route) => false,
    );
  }
}
