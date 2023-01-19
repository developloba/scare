import 'dart:convert';

import 'package:http/http.dart';
import 'package:scare/models/messagemodel.dart';

class ChatbotRepository {
  addChatBotMessage(MessageModel message) async {
    Response response = await post(
        Uri.parse(
            'http://9890-197-210-84-111.eu.ngrok.io/webhooks/rest/webhook'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'sender': message.senderid,
          'message': message.message,
        }));
    if (response.statusCode == 200) {
      MessageModel data = MessageModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      return MessageModel(
          message: response.reasonPhrase!,
          type: Messagetype.reciever,
          format: Messageformat.text);
    }
  }
}
