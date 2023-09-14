import 'dart:convert';

/*RegisterUserResponseModel registerUserResponseModel(String str) =>
    RegisterUserResponseModel.fromJson(json.decode(str));
class RegisterUserResponseModel {
  RegisterUserResponseModel({
    required this.token,
  });

  final String? token;

  factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json){
    return RegisterUserResponseModel(
      token: json["authtoken"]
    );
  }

}*/


class RegisterUserResponseModel{
  late String authtoken;
  RegisterUserResponseModel({
    this.authtoken = '',
});

  factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json){
    print('Register response: ${json['authtoken']}');
    return RegisterUserResponseModel(
    authtoken: json['authtoken']
    );
  }
}



