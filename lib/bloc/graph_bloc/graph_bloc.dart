import 'package:bloc/bloc.dart';
import 'package:scare/bloc/graph_bloc/graph_event.dart';
import 'package:scare/bloc/graph_bloc/graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  GraphBloc() : super(OnDataState(selected: const [true, false, false])) {
    on<OnDataEvent>((event, emit) =>
        emit(OnDataState(selected: const [true, false, false])));
    on<OnVoiceEvent>((event, emit) =>
        emit(OnVoiceState(selected: const [false, true, false])));
    on<OnSmsEvent>((event, emit) =>
        emit(OnSmsState(selected: const [false, false, true])));
    on<OpenGraphEvent>((event, emit) => emit(OpenGraphState()));
  }
}
