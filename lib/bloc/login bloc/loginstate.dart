import 'package:equatable/equatable.dart';
import 'package:scare/models/authentication_model.dart';
import 'package:scare/models/usermodel.dart';

abstract class Loginstate extends Equatable {}

class Initialstate extends Loginstate {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loadingstate extends Loginstate {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loadedstate extends Loginstate {
  final Usermodel data;
  final Authmodel pin;
  final String name;
  final String number;
  Loadedstate(
      {required this.data,
      required this.pin,
      required this.name,
      required this.number});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Errorstate extends Loginstate {
  late final String error;
  Errorstate({required this.error});
  @override
  List<Object?> get props => [];
}
