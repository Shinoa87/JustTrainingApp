import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/screens/screens.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  static const String routeName = '/transaction_history';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const TransactionHistoryScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TransactionHistoryDisplay(),
      floatingActionButton: CustomBottomNavigationBarButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(activeIndex: 2,),
    );
  }
}
