class Authmodel {
  final String number;
  final String pin;

  Authmodel({required this.number, this.pin = ''});
  factory Authmodel.fromJson(Map<String, dynamic> json) {
    return Authmodel(number: '', pin: json['pin']);
  }
}
