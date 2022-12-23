import 'package:flutter/material.dart';

import '../../../models/messagemodel.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key, required this.messageModel}) : super(key: key);
  final List<MessageModel> messageModel;
  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.messageModel.length,
        itemBuilder: ((context, index) {
          return Container(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Align(
              alignment:
                  (widget.messageModel[index].type == Messagetype.reciever
                      ? Alignment.topLeft
                      : Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color:
                      (widget.messageModel[index].type == Messagetype.reciever
                          ? const Color.fromARGB(255, 245, 220, 176)
                          : const Color.fromARGB(255, 244, 139, 54)),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.messageModel[index].message,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        }));
  }
}
