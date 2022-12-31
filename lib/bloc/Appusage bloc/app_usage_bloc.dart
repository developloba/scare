import 'package:bloc/bloc.dart';
import 'package:scare/bloc/Appusage%20bloc/app_usage_event.dart';
import 'package:scare/bloc/Appusage%20bloc/app_usage_state.dart';

class AppUsageBloc extends Bloc<AppUsageEvent, AppUsageState> {
  AppUsageBloc() : super(OnCloseState()) {
    on<OnOpenEvent>((event, emit) => emit(OnOpenState()));
    on<OnClosedEvent>((event, emit) => emit(OnCloseState()));
  }
}
