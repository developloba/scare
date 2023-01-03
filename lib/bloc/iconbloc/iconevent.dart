import 'package:equatable/equatable.dart';

class IconEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TypingEvent extends IconEvent {}

class ListeningEvent extends IconEvent {}

class NotListeningEvent extends IconEvent {}
