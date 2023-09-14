
import 'dart:convert';


GetUserResponseModel getUserResponseModel(String str) =>
    GetUserResponseModel.fromJson(json.decode(str));

class GetUserResponseModel {
  GetUserResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.date,
  });

  final String? id;
  final String? username;
  final String? email;
  final String? date;

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json){
    return GetUserResponseModel(
      id: json["_id"],
      username: json["username"],
      email: json["email"],
      date: json["date"],
    );
  }

}
