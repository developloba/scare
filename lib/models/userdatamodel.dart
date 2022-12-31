class UserDataModel {
  final String number;

  final String name;

  UserDataModel({
    required this.number,
    required this.name,
  });
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      number: json['phone'],
      name: json['username'],
    );
  }
}
