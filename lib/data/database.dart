import 'package:path/path.dart';
import 'package:scare/models/messagemodel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  initializeDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'message.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE messages(id INTEGER PRIMARY KEY, message TEXT, type MESSAGETYPE, format MESSAGEFORMAT)',
        );
      },
      version: 1,
    );
  }

  Future<void> createMessage(MessageModel message) async {}

  Future<List<MessageModel>> getMessages() async {
    final Database db = initializeDB();

    final List<Map<String, dynamic>> maps = await db.query('messages');

    return List.generate(maps.length, (i) {
      return MessageModel(
          message: maps[i]['message'],
          type: maps[i]['type'],
          format: maps[i]['format']);
    });
  }
}
