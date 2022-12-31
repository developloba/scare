class Usermodel {
  final String number;
  final String password;
  final String username;
  final String email;
  final String token;
  Usermodel(
      {required this.number,
      required this.password,
      this.email = '',
      this.username = '',
      this.token = ''});
  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
        number: json['user_id'],
        password: json['password'],
        username: '',
        token: json['token']);
  }
}
