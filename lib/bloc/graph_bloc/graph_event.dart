import 'package:equatable/equatable.dart';

class GraphEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnDataEvent extends GraphEvent {}

class OnVoiceEvent extends GraphEvent {}

class OnSmsEvent extends GraphEvent {}

class OpenGraphEvent extends GraphEvent {}
