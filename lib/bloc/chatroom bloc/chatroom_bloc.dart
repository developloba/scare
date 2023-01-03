import 'package:bloc/bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_event.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_state.dart';
import 'package:scare/data/chatbotrepository.dart';
import 'package:scare/models/messagemodel.dart';

class ChatroomBloc extends Bloc<Chatroomevent, Chatroomstate> {
  ChatbotRepository repo;

  ChatroomBloc(this.repo) : super(ChatroomInitialState(messages: [])) {
    on<Getmessages>((event, emit) => emit(Chatroomstate(messages: [])));
    on<Addmessageevent>((event, emit) async {
      final previousMessages = state.messages;
      previousMessages.add(event.messageModel);
      emit(Chatroomstate(messages: previousMessages));

      MessageModel data = await repo.addChatBotMessage(event.messageModel);
      previousMessages.add(data);
      emit(Chatroomstate(messages: previousMessages));
    });
    on<InitializeChatevent>(
        (event, emit) => emit(ChatroomInitialState(messages: [])));
  }
}
