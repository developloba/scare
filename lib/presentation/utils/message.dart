class ChatMessage {
  String messageContent;
  String messageType;
  bool textmessage;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      this.textmessage = true});
}
