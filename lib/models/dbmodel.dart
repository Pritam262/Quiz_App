class AuthenticationNames {
  static final String id = 'id';
  static final String name = 'name';
  static final String token = 'token';
  static final String loginTime = 'loginTime';
  static final TableName = 'Authentication';
  static final List<String> values = [id, name, token, loginTime];
}

class Auth {
  final int? id;
  final String name;
  final String token;
  final DateTime loginTime;
  const Auth({
    this.id,
    required this.name,
    required this.token,
    required this.loginTime,
  });
  Auth copy({
    int? id,
    String? name,
    String? token,
    DateTime? loginTime,
  }) {
    return Auth(
        id: id ?? this.id,
        name: name ?? this.name,
        token: token ?? this.token,
        loginTime: loginTime ?? this.loginTime);
  }

  static Auth fromJson(Map<String, Object?> json) {
    return Auth(
        id: json[AuthenticationNames.id] as int?,
        name: json[AuthenticationNames.name] as String,
        token: json[AuthenticationNames.token] as String,
        loginTime:
            DateTime.parse(json[AuthenticationNames.loginTime] as String));
  }

  Map<String, Object?>toJson(){
    return {
      AuthenticationNames.id:id,
      AuthenticationNames.name:name,
      AuthenticationNames.token:token,
      AuthenticationNames.loginTime:loginTime
    };
  }
}
