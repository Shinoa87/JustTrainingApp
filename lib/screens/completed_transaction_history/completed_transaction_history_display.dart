import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import 'package:just_training_app/widgets/widgets.dart';
import '../../enums/enums/status_enum.dart';

class CompletedTransactionHistoryDisplay extends StatefulWidget {
  const CompletedTransactionHistoryDisplay({Key? key}) : super(key: key);

  @override
  State<CompletedTransactionHistoryDisplay> createState() => _CompletedTransactionHistoryDisplayState();
}

class _CompletedTransactionHistoryDisplayState extends State<CompletedTransactionHistoryDisplay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const TransactionAppbar(),
          const SizedBox(height: 15,),
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
              }
              if (state is TransactionLoaded) {
                var sortedTransactions = state.transactions.where((elem) => elem.status == Status.ok).toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 105,
                    child: ListView.separated(
                      itemCount: sortedTransactions.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 9,),
                      itemBuilder: (BuildContext context, int index) =>
                          TransactionCard(
                            transaction: sortedTransactions[index],
                            index: index,
                          ),
                    ),
                  ),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Divider(
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 11,),
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
              }
              if (state is TransactionLoaded) {
                var sortedTransactions = state.transactions.where((elem) => elem.status == Status.ok).toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: SizedBox(
                    height: 396,
                    width: double.infinity,
                    child: ListView.separated(
                        itemCount: sortedTransactions.length,
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 9),
                        itemBuilder: (BuildContext context, int index) {
                          return TransactionInfoCard(
                            transaction: sortedTransactions[index],
                            index: index,
                          );
                        }
                    ),
                  ),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ],
      ),
    );
  }
}