import 'package:bloc/bloc.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_events.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_state.dart';
import 'package:scare/models/signinmodel.dart';

import '../../data/userrepository.dart';
import '../../models/userdatamodel.dart';
import '../../models/usermodel.dart';

class Siginupbloc extends Bloc<SigninEvent, Signinstate> {
  Userrepository repository;
  Siginupbloc(this.repository) : super(Initialstate()) {
    on<CreateUserEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        Signinmodel data = await repository.addUsers(event.data);
        UserDataModel userdata = await repository.getName(event.data.number);
        emit(Loadedstate(Usermodel(
            username: userdata.name,
            number: userdata.number,
            token: '',
            password: data.password)));
      } catch (e) {
        emit(Errorstate(error: e.toString()));
      }
    });
  }
}
