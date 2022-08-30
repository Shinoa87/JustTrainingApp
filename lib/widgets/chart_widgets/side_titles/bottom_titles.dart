import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget bottomTitles(double value, TitleMeta meta) {
  List<String> titles = ["","Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul","Aug","Sep","Oct","Nov","Dec",];

  Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, //margin top
    child: text,
  );
}

// Widget text = Text(
//   titles[value.toInt()],
//   style: const TextStyle(
//     color: Color(0xff7589a2),
//     fontWeight: FontWeight.bold,
//     fontSize: 14,
//   ),
// );