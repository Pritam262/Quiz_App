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
}

*/



// No error on authentication problem in web and linux


// Solve Code



import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/models/get_request_response.dart';

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

  static Future<void> setUserProfile(
      GetUserResponseModel userResponse
      ) async{
    APICacheDBModel cacheModel = APICacheDBModel(
      key: "user-profile",
      syncData: jsonEncode(userResponse.toJson()),
    );
    await APICacheManager().addCacheData(cacheModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("auth-token");
    await APICacheManager().deleteCache('user-profile');
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/loginpage',
          (route) => false,
    );
  }
}



/*
import 'package:quiz_app/models/dbmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SharedService {
  static final SharedService instance = SharedService._init();
  static Database? _database;
  SharedService._init();
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Auth.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY  AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE Auth(
    ${AuthenticationNames.id} $idType,
    ${AuthenticationNames.name} $textType,
    ${AuthenticationNames.token} $textType,
    ${AuthenticationNames.loginTime} $textType,
    )
    ''');
  }

  Future<Auth?> insertEntry(Auth auth) async {
    final db = await instance.database;
    final id =  await db!.insert(AuthenticationNames.TableName,auth.toJson() );
    return auth.copy(id: id);
  }

  Future<List<Auth>> readProfile() async {
    final db = await instance.database;
    // Aescending = ASC , Descending DESC
    final orderBy = '${AuthenticationNames.loginTime} ASC';
    final queryResult = await db!.query(AuthenticationNames.TableName, orderBy: orderBy);
    // print(queryResult);
    return queryResult.map((json) => Auth.fromJson(json)).toList();
  }

  Future<bool> isLoggedIn() async {
    final db = await instance.database;
    final orderBy = '${AuthenticationNames.loginTime} ASC';
    final queryResult = await db!.query(AuthenticationNames.TableName, orderBy: orderBy);

    // Check if there are any rows in the query result
    return queryResult.isNotEmpty;
  }


  Future updateProfile(Auth auth) async{
    final db = await instance.database;
    return await db!.update(AuthenticationNames.TableName,auth.toJson(), where: "${AuthenticationNames.id} == ?", whereArgs: [auth.id]);
  }

  Future deleteAuth(Auth? auth) async{
    final db = await instance.database;

    await db!.delete(AuthenticationNames.TableName, where: '${AuthenticationNames.id}== ?', whereArgs: [auth!.id]);
  }


  Future closeDb()async{
    final db = await instance.database;
    db!.close();
  }
}
*/






