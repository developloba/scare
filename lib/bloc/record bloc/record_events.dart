import 'package:equatable/equatable.dart';

class RecordingEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class StartRecordingEvent extends RecordingEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class StopRecordingEvent extends RecordingEvent {}

class PlayRecordingEvent extends RecordingEvent {}

class RecordingErrorEvent extends RecordingEvent {
  final String error;
  RecordingErrorEvent({required this.error});
}

class InitializeRecordingServiceEvent extends RecordingEvent {}
