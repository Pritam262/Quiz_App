
/*
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
*/


import 'dart:convert';

GetUserResponseModel getUserResponseModel(String str) =>
    GetUserResponseModel.fromJson(json.decode(str));

class GetUserResponseModel {
  GetUserResponseModel({
    required this.data,
  });
  late final Data data;

  GetUserResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.id,
    required this.name,
    required this.email,
    required this.date,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String date;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['date'] = date;
    print('User Data: $_data');
    return _data;
  }
}
