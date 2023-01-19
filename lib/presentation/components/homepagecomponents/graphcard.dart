import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/Appusage%20bloc/app_usage_state.dart';
import 'package:scare/presentation/utils/constants.dart';

import '../../../bloc/Appusage bloc/app_usage_bloc.dart';
import '../../../bloc/Appusage bloc/app_usage_event.dart';

class Graphcard extends StatelessWidget {
  const Graphcard(
      {Key? key,
      required this.ktextstylewhite,
      required this.ktextstyle,
      required this.graph,
      required this.flex,
      required this.height,
      required this.state,
      required this.title})
      : super(key: key);

  final TextStyle ktextstylewhite;
  final TextStyle ktextstyle;
  final Widget graph;
  final int flex;
  final double height;

  final AppUsageState state;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    state is OnCloseState
                        ? BlocProvider.of<AppUsageBloc>(context)
                            .add(OnOpenEvent())
                        : BlocProvider.of<AppUsageBloc>(context)
                            .add(OnClosedEvent());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'App Usage',
                      style: Style().kmediumstyle,
                    ),
                  )),
              Text(title, style: Style().ksmallstyleblack)
            ],
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/graph.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
