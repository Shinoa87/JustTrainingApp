import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/constants/constants.dart';
import '../../bloc/transaction_bloc/transaction_bloc.dart';
import '../../formatters/formatters.dart';
import '../../models/transaction_model/transaction_model.dart';
import 'package:just_training_app/enums/enums.dart';

class TransactionMenu extends StatefulWidget {

  const TransactionMenu({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<TransactionMenu> createState() => _TransactionMenuState();
}

class _TransactionMenuState extends State<TransactionMenu> {
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Transaction transaction = Transaction(
      id: Random().nextInt(99999999).toString(),
      date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      category: Formatters().fromStringToCategory('Others'),
      status: Formatters().fromStringToStatus('Ok'),
      description: '',
      transactionType: Formatters().fromStringToType('Profit'),
      moneyAmount: int.parse('0'),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right:16,left:16,top:34,bottom:13),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xff1B1B1B),
                      fontSize: 20,
                      fontWeight : FontWeight.w700,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  const SizedBox(height: 53),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      CustomTransactionSwitchCard(
                        titleSwitchName: 'Transaction type',
                        firstSwitchName: 'Profit',
                        secondSwitchName: 'Loss',
                        onToggle: (index) {
                          TransactionType value;
                          if (index == 0){
                            value = TransactionType.profit;
                          } else {
                            value = TransactionType.loss;
                          }
                          transaction = transaction.copyWith(
                            transactionType: value,
                          );
                        },
                      ),
                      const SizedBox(height:4),
                      CustomTransactionSwitchCard(
                        titleSwitchName: 'Status',
                        firstSwitchName: 'Ok',
                        secondSwitchName: 'Wait',
                        onToggle: (index) {
                          Status value;
                          if (index == 0){
                            value = Status.ok;
                          } else {
                            value = Status.wait;
                          }
                          transaction = transaction.copyWith(
                            status: value,
                          );
                        },
                      ),
                      const SizedBox(height:20),
                      CustomTransactionDateCard(
                        initialDate: DateTime.now(),
                        onDataChanged: (String date){
                          transaction = transaction.copyWith(
                            date: date,
                          );
                        },
                        selectedDateController: dateController,
                      ),
                      const SizedBox(height:20),
                      CustomTransactionCategoryDropdownCard(
                        onChanged: (value){
                          transaction = transaction.copyWith(
                              category: Formatters().fromStringToCategory(value),
                          );
                        },
                      ),
                      const SizedBox(height:20),
                      CustomTransactionMoneyAmountCard(
                        title: 'Enter amount',
                        onChanged: (value){
                          transaction = transaction.copyWith(
                            moneyAmount: int.parse(value!),
                              // moneyAmount: int.parse(value!),
                          );
                        },
                      ),
                      const SizedBox(height:20),
                      CustomTransactionDescriptionCard(
                        title: 'Description',
                        onChanged: (String? value){
                          transaction = transaction.copyWith(
                            description: '$value',
                          );
                        },
                      ),
                      const SizedBox(height:20),
                      CustomElevatedButton(
                        title: 'Add',
                        buttonColour: ColorConstants.mainPurpleColor,
                        titleColour: Colors.white,
                        onPressed: () {
                          BlocProvider.of<TransactionBloc>(context).add(
                            AddTransaction(transaction: transaction),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Positioned(
                top: 0,
                left: 10,
                child: OverallArrowBack(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}