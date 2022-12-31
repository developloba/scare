class Signinmodel {
  final String number;

  final String password;

  Signinmodel({
    required this.number,
    required this.password,
  });
  factory Signinmodel.fromJson(Map<String, dynamic> json) {
    return Signinmodel(
      number: json['phone'],
      password: json['password'],
    );
  }
}
