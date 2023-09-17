/*
class RegisterUserModel {
  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });

  final String? name;
  final String?email;
  final String? password;
  final String? confirmpassword;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json){
    return RegisterUserModel(
      name: json["username"],
      email:json['email'],
      password: json["password"],
      confirmpassword: json["confirmpassword"],
    );
  }

}


*/



class RegisterUserModel {
  RegisterUserModel({
    this.name,
    this.password,
    this.email,
  });
  late final String? name;
  late final String? password;
  late final String? email;

  RegisterUserModel.fromJson(Map<String, dynamic> json) {
    name = json['username'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = name;
    _data['password'] = password;
    _data['email'] = email;
    return _data;
  }
}