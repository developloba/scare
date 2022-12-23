import 'package:equatable/equatable.dart';
import 'package:scare/models/messagemodel.dart';

class Chatroomevent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Addmessageevent extends Chatroomevent {
  final MessageModel messageModel;
  Addmessageevent({required this.messageModel});

  @override
  List<MessageModel?> get props => [messageModel];
}

class Getmessages extends Chatroomevent {
  final MessageModel messageModel;
  Getmessages({required this.messageModel});

  @override
  List<MessageModel?> get props => [messageModel];
}
