import 'package:equatable/equatable.dart';
import 'package:scare/models/usermodel.dart';

abstract class SigninEvent extends Equatable {}

class CreateUserEvent extends SigninEvent {
  late final Usermodel data;
  CreateUserEvent({required this.data});
  @override
  List<Object?> get props => [];
}

class Errorevent extends SigninEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
