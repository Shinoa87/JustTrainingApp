import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/screens/chart/titles_data.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import '../../repositories/transaction_repository/transaction_repository.dart';
import '../../widgets/widgets.dart';

class ChartDisplay extends StatefulWidget {

  const ChartDisplay({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartDisplayState();
}

class ChartDisplayState extends State<ChartDisplay> {
  int touchedGroupIndex = -1;
  List showingBarGroups = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xff2c4260),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const TransactionAppbar(),
            const SizedBox(height: 16),
            Expanded(
              child:
              BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context,state) {
                  if (state is TransactionLoaded) {
                    return BarChart(
                      BarChartData(
                        maxY: 100,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.grey,
                            getTooltipItem: (a, b, c, d) => null,
                          ),
                        ),
                        titlesData: titlesData(),
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        barGroups:
                        TransactionRepository().getChartData(state.transactions),
                      ),
                    );
                  } else {
                    return const Text('something went wrong');
                  }
                }
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}