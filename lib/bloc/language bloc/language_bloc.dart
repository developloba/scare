import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scare/bloc/language%20bloc/langauge_event.dart';
import 'package:scare/bloc/language%20bloc/language_state.dart';

import '../../locale/language.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    on<ToggleLanguageEvent>(
        (event, emit) => emit(LanguageLoaded(Locale(event.language.code))));
  }
}
