class MessageModel {
  final String message;
  final Messagetype type;
  final Messageformat format;
  final String senderid;

  const MessageModel(
      {required this.message,
      required this.type,
      required this.format,
      this.senderid = ''});

  factory MessageModel.fromJson(List json) {
    return MessageModel(
        message: json[0]['text'],
        type: Messagetype.reciever,
        format: Messageformat.text,
        senderid: json[0]['recipient_id']);
  }
}

enum Messagetype { reciever, sender }

enum Messageformat { text, audio }
