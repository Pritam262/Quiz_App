/*
class LoginRequestModel {
  LoginRequestModel({
    required this.username,
    required this.password,
  });

  final String? username;
  final String? password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json){
    print('Model: $json');
    return LoginRequestModel(
      username: json["username"],
      password: json["password"],
    );
  }

}
*/



class LoginRequestModel {
  LoginRequestModel({
    this.email,
    this.password,
  });
  late final String? email;
  late final String? password;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    print('Login Request---- Email $email, Password: $password');
    print('Login JSON: $json');
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}
