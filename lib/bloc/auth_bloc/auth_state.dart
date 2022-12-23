import 'package:equatable/equatable.dart';
import 'package:scare/models/authentication_model.dart';

abstract class Authstate extends Equatable {}

class Initialstate extends Authstate {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loadingstate extends Authstate {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loadedstate extends Authstate {
  final Authmodel data;
  Loadedstate(this.data);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Errorstate extends Authstate {
  late final String error;
  Errorstate({required this.error});
  @override
  List<Object?> get props => [];
}
