import 'package:equatable/equatable.dart';

class GraphState extends Equatable {
  @override
  List<bool> get props => [];
}

class OnDataState extends GraphState {
  final List<bool> selected;
  final int index = 0;
  OnDataState({required this.selected});
}

class OnVoiceState extends GraphState {
  final List<bool> selected;
  final int index = 1;
  OnVoiceState({required this.selected});
}

class OnSmsState extends GraphState {
  final List<bool> selected;
  final int index = 2;
  OnSmsState({required this.selected});
}

class OpenGraphState extends GraphState {}
