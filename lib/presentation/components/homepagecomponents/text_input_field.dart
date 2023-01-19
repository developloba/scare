import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_event.dart';
import 'package:scare/bloc/iconbloc/iconevent.dart';

import 'package:scare/models/messagemodel.dart';
import 'package:scare/presentation/components/homepagecomponents/chatpagecomponent.dart';
import 'package:scare/presentation/utils/constants.dart';

import '../../../bloc/iconbloc/iconbloc.dart';
import '../../../bloc/iconbloc/iconstate.dart';

class TextInputField extends StatefulWidget {
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
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late StreamSubscription<bool> keyboardSubscription;
  @override
  @override
// void dispose() {
//   keyboardSubscription.cancel();
//   super.dispose();
// }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                size: 30,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: TextField(
                  onChanged: (value) {
                    BlocProvider.of<IconBloc>(context).add(TypingEvent());
                  },
                  onSubmitted: (value) {
                    BlocProvider.of<IconBloc>(context).add(NotListeningEvent());
                  },
                  autofocus: true,
                  controller: widget.controls,
                  style: Style().ksmallstyle,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 2.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Colors.white38),
                )),
          ),
          BlocBuilder<IconBloc, IconState>(builder: (context, state) {
            if (state is TypingState) {
              return IconButton(
                  icon: const Icon(Icons.send),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () async {
                    BlocProvider.of<ChatroomBloc>(context).add(Addmessageevent(
                        messageModel: MessageModel(
                            message: widget.controls.text,
                            type: Messagetype.sender,
                            format: Messageformat.text,
                            senderid: widget.widget.userid)));
                    widget.controls.clear();
                  });
            } else if (state is ListeningState) {
              return IconButton(
                icon: const Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: (() {
                  widget.function!.call();
                }),
              );
            } else {
              return IconButton(
                icon: const Icon(
                  Icons.mic_off,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: (() {
                  widget.function!.call();
                }),
              );
            }
          })
        ],
      ),
    );
  }
}
