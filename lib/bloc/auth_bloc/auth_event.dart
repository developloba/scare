import 'package:equatable/equatable.dart';

import '../../models/authentication_model.dart';

abstract class Authevent extends Equatable {}

class AuthUserEvent extends Authevent {
  late final Authmodel data;
  AuthUserEvent({required this.data});
  @override
  List<Object?> get props => [];
}

class Errorevent extends Authevent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
