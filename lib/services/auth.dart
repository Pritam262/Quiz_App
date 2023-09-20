/*
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/login_request_model.dart';
import 'package:quiz_app/models/authentication_response_model.dart';
import 'package:quiz_app/models/register_user_model.dart';
import 'package:quiz_app/config.dart';
import 'package:quiz_app/models/register_user_response_model.dart';
import 'package:quiz_app/services/shared_service.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> signWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.accessToken);
    final userCredencial = await _auth.signInWithCredential(credential);
    final User? user = userCredencial.user;
    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);
    final User? currentUser = await _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    print(user);
  } catch (error) {
    print('Error occured in SignIn');
    print(error);
  }
}

Future<RegisterUserResponseModel> signinWithEmail(
    RegisterUserModel model) async {
  Map<String, String> header = <String, String>{
    "Content-Type": "application/json"
  };

  final response = await http.post(
    Uri.parse('${Config.apiUrl}:${Config.port}/${Config.registrationApi}'),
    headers: header,
    body: jsonEncode(model),
  );

  return RegisterUserResponseModel(authtoken: response.body);
}

Future<bool?> loginWithEmail(LoginRequestModel model) async {
  // print('${model.username}, ${model.password}');
  Map<String, String> header = <String, String>{
    "Content-Type": "application/json"
  };

  final response = await http.post(
    Uri.parse('${Config.apiUrl}:${Config.port}/${Config.loginApi}'),
    headers: header,
    body: jsonEncode(model),
  );
  if (response.statusCode == 200) {
    Map resData = jsonDecode(response.body);
    print(resData);
    // Shared
    await SharedService.setLoginDetails(
        loginResponseJson(jsonDecode(response.body)));
    return true;
  } else {
    return false;
  }

}
*/

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/models/get_request_response.dart';

import '../../config.dart';
import '../models/login_request_model.dart';
import '../models/authentication_response_model.dart';
import '../models/register_user_model.dart';
import 'shared_service.dart';

class APIService {








  // LogIn With email or restAPI
  static var client = http.Client();

  static Future<bool> loginWithEmail(
      LoginRequestModel model,
      ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiUrl,
      Config.loginApi,
    );
// print(model.toJson());
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(
        authResponseJson(
          response.body,
        ),
      );
      getUserProfile();

      return true;
    } else {
      return false;
    }
  }




  // SignIn with Email or RestAPI
  static Future<bool> registerWithEmail(
      RegisterUserModel model,
      ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiUrl,
      Config.registrationApi,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {

      await SharedService.setLoginDetails(
        authResponseJson(
          response.body,
        ),
      );
      getUserProfile();

      return true;
    } else {
      return false;
    }
  }



  // GetUser profile data using RestAPI
  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'auth-token': '${loginDetails?.data.token}'
    };
    var url = Uri.http(Config.apiUrl, Config.getUserApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      await SharedService.setUserProfile(
        getUserResponseModel(response.body),
      );
      return response.body;
    } else {
      return "";
    }
  }
}
