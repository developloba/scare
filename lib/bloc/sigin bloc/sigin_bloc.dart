import 'package:bloc/bloc.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_events.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_state.dart';

import '../../data/userrepository.dart';

class Siginupbloc extends Bloc<SigninEvent, Signinstate> {
  Userrepository repository;
  Siginupbloc(this.repository) : super(Initialstate()) {
    on<CreateUserEvent>((event, emit) async {
      emit(Loadingstate());
      try {
        var data = await repository.addUsers(event.data);
        emit(Loadedstate(data));
      } catch (e) {
        emit(Errorstate(error: e.toString()));
      }
    });
  }
}
