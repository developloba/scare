import 'package:flutter/material.dart';

class Opener extends StatefulWidget {
  const Opener({super.key, required this.userid, required this.iconButton});
  final String userid;
  final IconButton iconButton;

  @override
  State<Opener> createState() => _OpenerState();
}

class _OpenerState extends State<Opener> {
  // RecordingService recordingService = RecordingService();
  @override
  Widget build(BuildContext context) {
    return widget.iconButton;
  }
}
