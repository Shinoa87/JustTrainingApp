import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'completed_transaction_history_display.dart';

class CompletedTransactionHistoryScreen extends StatelessWidget {
  const CompletedTransactionHistoryScreen({Key? key}) : super(key: key);

  static const String routeName = '/completed_transaction_history';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const CompletedTransactionHistoryScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CompletedTransactionHistoryDisplay(),
      floatingActionButton: CustomBottomNavigationBarButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(activeIndex: 1,),
    );
  }
}
