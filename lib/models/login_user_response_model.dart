
import 'dart:convert';

LoginUserResponseModel loginResponseJson(String str) =>
    LoginUserResponseModel.fromJson(json.decode(str));

class LoginUserResponseModel {
  LoginUserResponseModel({
    required this.token,
  });

  final String? token;

  factory LoginUserResponseModel.fromJson(Map<String, dynamic> json){
    return LoginUserResponseModel(
      token: json["authtoken"],
    );
  }

}
