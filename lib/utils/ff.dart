import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SfCircularChart(
                  // title: ChartTitle(text: "Test Sample of Radial chart"),
                  // // legend: const Legend(isVisible: true),
                  // series: <CircularSeries<_PieData, String>>[
                  //   RadialBarSeries(
                  //     xValueMapper: (_PieData data, _) => data.xData,
                  //     yValueMapper: (_PieData data, _) => data.yData,
                  //     dataLabelMapper: (_PieData data, _) => data.text,
                  //   )
                  // ],
                ),

                SfCartesianChart(),
                SfCircularChart(
                  // title: ChartTitle(text: "Test Sample of Pie chart"),
                  // legend: const Legend(isVisible: true),
                  // series: <PieSeries<_PieData, String>>[
                  //   PieSeries<_PieData, String>(
                  //     explode: true,
                  //     explodeIndex: 0,
                  //     dataSource: pieData,
                  //     xValueMapper: (_PieData data, _) => data.xData,
                  //     yValueMapper: (_PieData data, _) => data.yData,
                  //     dataLabelMapper: (_PieData data, _) => data.text,
                  //     // dataLabelSettings: const DataLabelSettings(isVisible: true),
                  //   ),
                  // ],
                ),
                // SfPyramidChart(backgroundColor: Colors.green,)
                // SfFunnelChart(
                //   borderColor: Colors.black,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}