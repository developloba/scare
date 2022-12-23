import 'package:equatable/equatable.dart';
import 'package:scare/models/messagemodel.dart';

class ChatRoomState extends Equatable {
  const ChatRoomState({
    this.messages = const [],
    this.isLoading = false,
    this.hasError = false,
    this.error = '',
  });
  final List<MessageModel> messages;
  final bool isLoading;
  final bool hasError;
  final String error;

  ChatRoomState copyWith({
    List<MessageModel>? messages,
    bool? isLoading,
    bool? hasError,
    String? error,
  }) {
    return ChatRoomState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [];
}



// class ChatroomInitialState extends ChatRoomState {
//   List<MessageModel> messages = [];
//   ChatroomInitialState({required this.messages});
// }

// class LoadingState extends ChatRoomState {}
