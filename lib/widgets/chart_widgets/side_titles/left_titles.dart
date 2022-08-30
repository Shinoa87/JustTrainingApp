import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 10) {
    text = '10K';
  } else if (value == 50) {
    text = '50K';
  } else if (value == 100) {
    text = '100K';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}