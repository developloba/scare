
// class Messagebloc extends Bloc<ChatRoomEvent, ChatRoomState> {
//   MessageRepository repository;
//   Messagebloc(this.repository) : super(const ChatRoomState()) {
//     on<Getmessages>((event, emit) async {
//       emit(state.copyWith(isLoading: true));
//       final messages = await repository.getallmessages();
//       emit(state.copyWith(messages: messages));
//     });
//     on<AddMessage>((event, emit) {
//       final previousMessages = state.messages;
//       previousMessages.add(event.message);
//       emit(state.copyWith(messages: previousMessages));
//     });
//   }
// // }
