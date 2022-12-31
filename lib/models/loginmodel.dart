class Loginmodel {
  final String number;

  final String password;
  final String token;

  Loginmodel(
      {required this.number, required this.password, required this.token});
  factory Loginmodel.fromJson(Map<String, dynamic> json) {
    return Loginmodel(
        number: json['user_id'],
        password: json['password'],
        token: json['token']);
  }
}
