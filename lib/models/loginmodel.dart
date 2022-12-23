class Loginmodel {
  final String number;

  final String password;

  Loginmodel({
    required this.number,
    required this.password,
  });
  factory Loginmodel.fromJson(Map<String, dynamic> json) {
    return Loginmodel(
      number: json['phone'],
      password: json['password'],
    );
  }
}
