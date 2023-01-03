import 'package:equatable/equatable.dart';

class IconState extends Equatable {
  @override
  List<bool> get props => [];
}

class ListeningState extends IconState {}

class TypingState extends IconState {}

class NotListeningState extends IconState {}
