import 'package:fl_chart/fl_chart.dart';
import '../../widgets/widgets.dart';

FlTitlesData titlesData() {
  return FlTitlesData(
    show: true,
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: bottomTitles,
        reservedSize: 42,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 28,
        interval: 1,
        getTitlesWidget: leftTitles,
      ),
    ),
  );
}
