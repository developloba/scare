import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/iconbloc/iconevent.dart';
import 'package:scare/bloc/iconbloc/iconstate.dart';

class IconBloc extends Bloc<IconEvent, IconState> {
  IconBloc() : super(NotListeningState()) {
    on<ListeningEvent>((event, emit) {
      emit(ListeningState());
    });
    on<TypingEvent>((event, emit) {
      emit(TypingState());
    });
    on<NotListeningEvent>((event, emit) => emit(NotListeningState()));
  }
}
