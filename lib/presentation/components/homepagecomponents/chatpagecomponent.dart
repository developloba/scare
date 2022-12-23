import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_state.dart';

import 'package:scare/models/messagemodel.dart';
import 'package:scare/presentation/components/homepagecomponents/chatlist.dart';
import 'package:scare/presentation/components/homepagecomponents/text_input_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.userid});
  final String userid;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controls = TextEditingController();
  final listViewBloc = StreamController<List<MessageModel>>();
  final StreamController<String> nullcontroller = StreamController<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 0.8,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 19, 25, 25),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BlocBuilder<ChatroomBloc, Chatroomstate>(
                  builder: (context, state) {
                    if (state is ChatroomErrorState) {
                      return ChatBody(messageModel: state.messages);
                    }
                    if (state is ChatroomLoadingState) {
                      return ChatBody(messageModel: state.messages);
                    } else {
                      return ChatBody(
                        messageModel: state.messages,
                      );
                    }
                  },
                ),
              )),
          TextInputField(
              controls: controls,
              widget: widget,
              listeningicon: Icons.mic_off,
              function: (() {
                // BlocProvider.of<RecordingBloc>(context)
                //     .add(StartRecordingEvent());
              }))
        ],
      ),
    );
  }
}
