import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/enums/enums.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import 'package:just_training_app/screens/screens.dart';
import '../../formatters/formatters.dart';
import '../../models/transaction_model/transaction_model.dart';

class TransactionInfoCard extends StatelessWidget {

  final Transaction transaction;
  final int index;

  const TransactionInfoCard({
    Key? key,
    required this.transaction,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.pink.withOpacity(0.1),
      title: Text(
        transaction.category.getName,
        style: TextStyle(
          color: transaction.category.getColorTitle,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
      ),
      subtitle:  Text(
        transaction.date.toString(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
      ),
      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20, // space between two icons
        children: [
          Text(
            '${transaction.transactionType.getMoneySign}${(transaction.moneyAmount).toString()}${transaction.transactionType.getFormattedMoney}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
              color: transaction.transactionType.getMoneyColor,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: transaction.category.getColorTitle,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          child: transaction.status == Status.ok ? Icon(
            Icons.done,
            color: transaction.category.getColorTitle,
          ) : null,
        ),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: Text(
                transaction.description,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: transaction.category.getColorTitle
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  color: transaction.category.getColorTitle,
                  onPressed: () {
                    BlocProvider.of<TransactionBloc>(context).add(
                      CompleteTransaction(transaction: transaction),
                    );
                  },
                  icon: transaction.status.getIcon,
                ),
                IconButton(
                  color: transaction.category.getColorTitle,
                  onPressed: () {
                    Navigator.pushNamed(context, EditTransactionScreen.routeName);
                  },
                  icon: const Icon(Icons.edit_note_outlined),
                ),
                IconButton(
                  color: transaction.category.getColorTitle,
                  onPressed: () {
                    BlocProvider.of<TransactionBloc>(context).add(
                      DeleteTransaction(transaction: transaction),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
