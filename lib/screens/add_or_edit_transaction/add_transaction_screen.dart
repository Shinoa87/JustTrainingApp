import 'package:flutter/material.dart';
import 'package:just_training_app/screens/add_or_edit_transaction/transaction_menu.dart';


class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/add_transaction';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const AddTransactionScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TransactionMenu(
        title: "Add a transaction",
      ),
    );
  }
}
