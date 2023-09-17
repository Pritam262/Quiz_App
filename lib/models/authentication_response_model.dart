/*
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

}*/


import 'dart:convert';

AuthenticationResponseModel authResponseJson(String str) =>
    AuthenticationResponseModel.fromJson(json.decode(str));

class AuthenticationResponseModel {
  AuthenticationResponseModel({
    required this.data,
  });
  late final Data data;

  AuthenticationResponseModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    var _data = <String, dynamic>{};
    // _data['data'] = data.toJson();
    _data = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.token,
  });
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['authtoken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['authtoken'] = token;
    return _data;
  }
}
