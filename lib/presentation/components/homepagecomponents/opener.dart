import 'package:scare/presentation/components/homepagecomponents/chatpagecomponent.dart';
import 'package:flutter/material.dart';

class Opener extends StatefulWidget {
  const Opener({super.key, required this.userid});
  final String userid;

  @override
  State<Opener> createState() => _OpenerState();
}

class _OpenerState extends State<Opener> {
  // RecordingService recordingService = RecordingService();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.mic,
        size: 35,
        color: Colors.black,
      ),
      onPressed: () {
        // recordingService.initRecorder();
        Scaffold.of(context).showBottomSheet((context) => ChatPage(
              userid: widget.userid,
            ));
      },
    );
  }
}
