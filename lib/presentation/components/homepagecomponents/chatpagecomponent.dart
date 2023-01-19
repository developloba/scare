import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_event.dart' as chat;
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

  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatroomBloc>(context).add(chat.Getmessages(
        messageModel: const MessageModel(
            message: '',
            type: Messagetype.sender,
            format: Messageformat.text)));
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible == false) {
          return ChatPageComponent(
            controls: controls,
            widget: widget,
            scale: 0.78,
          );
        } else {
          return ChatPageComponent(
              controls: controls, widget: widget, scale: 0.48);
        }
      },
    );
  }
}

class ChatPageComponent extends StatefulWidget {
  const ChatPageComponent(
      {Key? key,
      required this.controls,
      required this.widget,
      required this.scale})
      : super(key: key);

  final TextEditingController controls;
  final ChatPage widget;
  final double scale;

  @override
  State<ChatPageComponent> createState() => _ChatPageComponentState();
}

class _ChatPageComponentState extends State<ChatPageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * widget.scale,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 19, 25, 25),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 12,
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
          Expanded(
            flex: 3,
            child: TextInputField(
                controls: widget.controls,
                widget: widget.widget,
                listeningicon: Icons.mic_off,
                function: (() {
                  // BlocProvider.of<RecordingBloc>(context)
                  //     .add(StartRecordingEvent());
                })),
          )
        ],
      ),
    );
  }
}
