import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<double> summarry = [
    39.6,
    64.5,
    23.4,
    100.55,
    3.7,
    25.4,
    77.9,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SfCircularChart(
            title: ChartTitle(
              text: "PieChart Sample",
            ),
            legend: Legend(isVisible: true),
            series: <CircularSeries<_PieData, String>>[
              PieSeries(
                explode: true,
                dataSource: pieData,
                xValueMapper: (_PieData data, int index) => data.label,
                yValueMapper: (_PieData data, int index) => data.yData,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
         
        ],
      ),
    );
  }
}

List<_PieData> pieData = [
  _PieData("Sunday", 9, 8),
  _PieData("Monday", 38, 12),
  _PieData("Tuesday", 32, 14),
  _PieData("Wednesday", 312, 100),
  _PieData("Thursday", 3, 40),
  _PieData("Friday", 80, 23),
  _PieData("Sat", 120, 66),
];

class _PieData {
  _PieData(this.label, this.yData, this.xData);
  final String label;
  final num yData;
  final num xData;
}
