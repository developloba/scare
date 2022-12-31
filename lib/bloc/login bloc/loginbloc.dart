import 'package:bloc/bloc.dart';
import 'package:scare/bloc/login%20bloc/loginevent.dart';
import 'package:scare/bloc/login%20bloc/loginstate.dart';
import 'package:scare/models/authentication_model.dart';
import 'package:scare/models/loginmodel.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/data/userrepository.dart';

import '../../models/userdatamodel.dart';

class Loginbloc extends Bloc<Loginevent, Loginstate> {
  Userrepository repository;
  Loginbloc(this.repository) : super(Initialstate()) {
    on<LoginUserEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        final Loginmodel data = await repository.loginUser(event.data);
        // final Authmodel authmodeldata = await repository
        //     .authenticateUser(Authmodel(number: event.data.number));
        UserDataModel userdata = await repository.getName(event.data.number);
        emit(Loadedstate(
            data: Usermodel(
                username: userdata.name,
                number: userdata.number,
                token: data.token,
                password: data.password),
            pin: Authmodel(number: '', pin: ''),
            name: userdata.name,
            number: userdata.number));
      } catch (e) {
        emit(Errorstate(error: e.toString()));
      }
    });
    on<LogOutUserEvent>((event, emit) async {
      await repository.logOut(event.token);
      emit(Initialstate());
    });
  }
}
