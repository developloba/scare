import 'package:bloc/bloc.dart';
import 'package:scare/bloc/auth_bloc/auth_event.dart';
import 'package:scare/models/authentication_model.dart';

import 'package:scare/data/userrepository.dart';

import 'auth_state.dart';

class Authbloc extends Bloc<Authevent, Authstate> {
  Userrepository repository;
  Authbloc(this.repository) : super(Initialstate()) {
    on<AuthUserEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        final Authmodel data = await repository.authenticateUser(event.data);
        emit(Loadedstate(data));
      } catch (e) {
        emit(Errorstate(error: e.toString()));
      }
    });
  }
}
