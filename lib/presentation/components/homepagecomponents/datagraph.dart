import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/userdata.dart';

class DataChart extends StatelessWidget {
  const DataChart(
      {Key? key,
      required this.ktextstylewhite,
      required this.data,
      required this.title})
      : super(key: key);

  final TextStyle ktextstylewhite;
  final List<UserData> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(text: title, textStyle: ktextstylewhite),
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<UserData, String>>[
          LineSeries<UserData, String>(
              dataSource: data,
              xValueMapper: (UserData data, _) => data.year,
              yValueMapper: (UserData data, _) => data.count)
        ]);
  }
}
