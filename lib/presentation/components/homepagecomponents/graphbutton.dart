import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/graph_bloc/graph_bloc.dart';
import 'package:scare/presentation/utils/constants.dart';

import '../../../bloc/graph_bloc/graph_event.dart';

class GraphButton extends StatefulWidget {
  GraphButton(
      {Key? key,
      required this.text,
      required this.selected,
      required this.index})
      : super(key: key);
  final String text;
  List<bool> selected;
  int index;

  @override
  State<GraphButton> createState() => _GraphButtonState();
}

class _GraphButtonState extends State<GraphButton> {
  List events = [OnDataEvent(), OnVoiceEvent(), OnSmsEvent()];
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<GraphBloc>(context).add(events[widget.index]);
      },
      style: widget.selected[widget.index]
          ? ElevatedButton.styleFrom(
              backgroundColor: kPrimarycolor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)))
          : ElevatedButton.styleFrom(
              backgroundColor: kbackgroundcolor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.text,
          style: widget.selected[widget.index]
              ? const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Pop',
                  color: Colors.white,
                )
              : const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Pop',
                  color: Colors.black,
                ),
        ),
      ),
    );
  }
}
