// import 'package:bloc/bloc.dart';
// import 'package:scare/bloc/record%20bloc/record_events.dart';
// import 'package:scare/bloc/record%20bloc/record_state.dart';
// import 'package:scare/data/recording_service.dart';

// class RecordingBloc extends Bloc<RecordingEvent, RecordingState> {
//   RecordingService recordingService;
//   RecordingBloc(this.recordingService) : super(NotRecordingstate()) {
//     on<StartRecordingEvent>((event, emit) {
//       emit(CurrentlyRecordingstate());
//       recordingService.startRecording();
//     });
//     on<StopRecordingEvent>((event, emit) {
//       recordingService.stopRecording();
//       emit(NotRecordingstate());
//     });
//   }
// }
