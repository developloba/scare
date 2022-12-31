import 'package:equatable/equatable.dart';
import 'package:scare/models/usermodel.dart';

abstract class Loginevent extends Equatable {}

class LoginUserEvent extends Loginevent {
  late final Usermodel data;
  LoginUserEvent({required this.data});
  @override
  List<Object?> get props => [];
}

class LogOutUserEvent extends Loginevent {
  late final String token;
  LogOutUserEvent({required this.token});
  @override
  List<Object?> get props => [];
}

class Errorevent extends Loginevent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
