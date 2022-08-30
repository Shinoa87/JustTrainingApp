import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';

class ChartModel{
  final Color? positiveSumcolor;
  final Color? negativeSumcolor;
  final double? width;

  ChartModel({
    this.width,
    required this.negativeSumcolor,
    required this.positiveSumcolor,
  });

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: positiveSumcolor,
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        color: negativeSumcolor,
        width: width,
      ),
    ]);
  }
}