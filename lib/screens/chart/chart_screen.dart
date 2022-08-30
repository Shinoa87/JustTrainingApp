import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import '../../repositories/transaction_repository/transaction_repository.dart';
import '../../widgets/overall_widgets/custom_bottom_navigation_bar.dart';
import '../../widgets/overall_widgets/custom_bottom_navigation_bar_button.dart';
import 'chart_display.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  static const String routeName = '/chart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider(create: (context) => TransactionBloc(transactionRepository: context.read<TransactionRepository>())..add(const LoadTransactions()),
        child: const ChartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2c4260),
      body: ChartDisplay(),
      floatingActionButton: CustomBottomNavigationBarButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(activeIndex: 0),
    );
  }
}