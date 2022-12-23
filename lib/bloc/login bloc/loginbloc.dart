import 'package:bloc/bloc.dart';
import 'package:scare/bloc/login%20bloc/loginevent.dart';
import 'package:scare/bloc/login%20bloc/loginstate.dart';
import 'package:scare/models/authentication_model.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/data/userrepository.dart';

class Loginbloc extends Bloc<Loginevent, Loginstate> {
  Userrepository repository;
  Loginbloc(this.repository) : super(Initialstate()) {
    on<LoginUserEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        final Usermodel data = await repository.loginuser(event.data);
        final Authmodel authmodeldata = await repository
            .authenticateUser(Authmodel(number: event.data.number));
        emit(Loadedstate(data: data, pin: authmodeldata));
      } catch (e) {
        emit(Errorstate(error: e.toString()));
      }
    });
  }
}
