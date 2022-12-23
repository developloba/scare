import 'package:equatable/equatable.dart';

class RecordingState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NotRecordingstate extends RecordingState {}

class CurrentlyRecordingstate extends RecordingState {}

class InitializeRecordingState extends RecordingState {}

class StopRecordingState extends RecordingState {}

class UninitializedRecordingState extends RecordingState {}
