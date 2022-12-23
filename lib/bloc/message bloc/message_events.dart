import 'package:equatable/equatable.dart';
import 'package:scare/models/messagemodel.dart';

class ChatRoomEvent extends Equatable {
  final MessageModel message;

  const ChatRoomEvent(this.message);
  @override
  List<Object?> get props => [message];
}

// ignore: must_be_immutable
class AddMessage extends ChatRoomEvent {
  const AddMessage(super.message);
}

class Getmessages extends ChatRoomEvent {
  const Getmessages(super.message);
}
