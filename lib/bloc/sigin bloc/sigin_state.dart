import 'package:equatable/equatable.dart';
import 'package:scare/models/usermodel.dart';

abstract class Signinstate extends Equatable {}

class Initialstate extends Signinstate {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loadingstate extends Signinstate {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Loadedstate extends Signinstate {
  final Usermodel data;
  Loadedstate(this.data);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Errorstate extends Signinstate {
  late final String error;
  Errorstate({required this.error});
  @override
  List<Object?> get props => [];
}
