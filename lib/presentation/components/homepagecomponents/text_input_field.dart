import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_event.dart';
import 'package:scare/models/messagemodel.dart';
import 'package:scare/presentation/components/homepagecomponents/chatpagecomponent.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      required this.controls,
      required this.widget,
      this.listeningicon = Icons.mic_off,
      this.function})
      : super(key: key);

  final TextEditingController controls;
  final ChatPage widget;
  final IconData listeningicon;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                listeningicon,
                color: Colors.white,
                size: 30,
              ),
              onPressed: (() {
                function!.call();
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 50,
                  child: TextField(
                    autofocus: true,
                    controller: controls,
                    style:
                        const TextStyle(color: Colors.white, fontFamily: 'Pop'),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        filled: true,
                        fillColor: Colors.white38),
                  )),
            ),
            IconButton(
              onPressed: () async {
                BlocProvider.of<ChatroomBloc>(context).add(Addmessageevent(
                    messageModel: MessageModel(
                        message: controls.text,
                        type: Messagetype.sender,
                        format: Messageformat.text,
                        senderid: widget.userid)));
                controls.clear();
              },
              icon: const Icon(
                Icons.send,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
