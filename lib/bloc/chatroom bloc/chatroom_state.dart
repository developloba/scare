import 'package:scare/models/messagemodel.dart';

class Chatroomstate {
  late final List<MessageModel> messages;

  Chatroomstate({required this.messages});
}

class ChatroomErrorState extends Chatroomstate {
  final List<MessageModel> previousmessages;
  final String error;
  ChatroomErrorState({required this.error, required this.previousmessages})
      : super(messages: previousmessages) {
    previousmessages.add(MessageModel(
        message: error,
        type: Messagetype.reciever,
        format: Messageformat.text));
  }
}

class ChatroomLoadingState extends Chatroomstate {
  final List<MessageModel> previousmessages;
  final String loadingmessage;

  ChatroomLoadingState({
    this.loadingmessage = 'Sending...',
    required this.previousmessages,
  }) : super(messages: previousmessages) {
    previousmessages.add(MessageModel(
        message: loadingmessage,
        type: Messagetype.reciever,
        format: Messageformat.text));
  }
}
