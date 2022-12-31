import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/presentation/components/homepagecomponents/graphbutton.dart';

import '../../../bloc/graph_bloc/graph_bloc.dart';
import '../../../bloc/graph_bloc/graph_state.dart';
import '../../../data/userdata.dart';
import 'datagraph.dart';

class UserDataGraph extends StatefulWidget {
  const UserDataGraph(
      {Key? key,
      required this.ktextstylewhite,
      required this.selected,
      required this.data,
      required this.index,
      this.title = const ['Data Usage', 'Voice Usage', 'Sms Usage']})
      : super(key: key);

  final TextStyle ktextstylewhite;
  final List<bool> selected;
  final List<UserData> data;
  final List<String> title;
  final int index;

  @override
  State<UserDataGraph> createState() => _UserDataGraphState();
}

class _UserDataGraphState extends State<UserDataGraph> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
              color: Colors.black,
              elevation: 15,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DataChart(
                      title: widget.title[widget.index],
                      ktextstylewhite: widget.ktextstylewhite,
                      data: widget.data),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GraphButton(
                        text: 'Data',
                        selected: widget.selected,
                        index: 0,
                      ),
                      GraphButton(
                        text: 'Voice',
                        selected: widget.selected,
                        index: 1,
                      ),
                      GraphButton(
                        text: 'Sms',
                        selected: widget.selected,
                        index: 2,
                      )
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
