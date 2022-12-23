class Usermodel {
  final String number;
  final String password;
  final String username;
  final String email;
  Usermodel(
      {required this.number,
      required this.password,
      this.email = '',
      this.username = ''});
  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
        number: json['phone'],
        password: json['password'],
        username: json['token'],
        email: json['email']);
  }
}
