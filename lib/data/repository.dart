import 'package:scare/data/database.dart';
import 'package:scare/models/messagemodel.dart';

class MessageRepository {
  final service = DatabaseService();

  Future createmessage({required MessageModel message}) =>
      service.createMessage(message);
  Future<List<MessageModel>> getallmessages() => service.getMessages();
}
