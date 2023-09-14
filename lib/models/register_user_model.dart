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
