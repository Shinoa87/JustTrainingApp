import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/screens/add_or_edit_transaction/transaction_menu.dart';
import 'package:just_training_app/screens/screens.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import '../../cubits/sign_in_cubit/signin_qubit.dart';
import '../../models/transaction_model/transaction_model.dart';
import '../../repositories/transaction_repository/transaction_repository.dart';


class EditTransactionScreen extends StatelessWidget {
  const EditTransactionScreen({
    Key? key,
  }) : super(key: key);



  static const String routeName = '/edit_transaction';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const EditTransactionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransactionMenu(
        title: "Edit a transaction",
      ),
    );
  }
}
