import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/login_request_model.dart';
import 'package:quiz_app/models/login_user_response_model.dart';
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

/*Future<User?> signinWithEmail(RegisterUserModel model)async{
  var requestHeaders = {
    'Content-Type':"application/json"
  };
*/ /*  Map<String String> requestHeaders = {
    'Content-Type':"application/json",
  };*/ /*
  // var url = Uri.http(Config.apiUrl, Config.registrationApi);

  try{
    http.post(
      Uri.parse('127.0.0.1:3000//api/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        model,
      }),
    );
    print(http.Response);

  }catch(error){
    print('Error occured in signWithEmail');
    print(error);
  }
  return null;

}*/

/*
Future<User?> loginWithEmail(String email, String password)async{
  try{
    print('Login credencial---- Email: $email, Password: $password');
  }catch(error){
    print('Error occured in signWithEmail');
    print(error);
  }
  return null;

}*/

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
/*  if(response.statusCode == 200){
    Map resData = jsonDecode(response.body);
    print(resData);
    return true;
  }
  else{
    return false;
  }*/
}

Future<bool?> loginWithEmail(LoginRequestModel model) async {
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
  return null;
}
