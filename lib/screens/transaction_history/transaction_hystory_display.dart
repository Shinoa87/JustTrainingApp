 import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import '../../bloc/transaction_bloc/transaction_bloc.dart';
 import 'package:just_training_app/widgets/widgets.dart';

 class TransactionHistoryDisplay extends StatefulWidget {
   const TransactionHistoryDisplay({Key? key}) : super(key: key);

   @override
   State<TransactionHistoryDisplay> createState() => _TransactionHistoryDisplayState();
 }

 class _TransactionHistoryDisplayState extends State<TransactionHistoryDisplay> {
   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: SingleChildScrollView(
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
                   return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 17.0),
                     child: SizedBox(
                       width: double.infinity,
                       height: 105,
                       child: ListView.separated(
                         itemCount: state.transactions.length,
                         scrollDirection: Axis.horizontal,
                         separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 9,),
                         itemBuilder: (BuildContext context, int index) =>
                           TransactionCard(
                             transaction: state.transactions[index],
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
                   return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 17.0),
                     child: SizedBox(
                       height: 396,
                       width: double.infinity,
                       child: ListView.separated(
                         itemCount: state.transactions.length,
                         separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 9),
                         itemBuilder: (BuildContext context, int index) {
                           return TransactionInfoCard(
                             transaction: state.transactions[index],
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
       ),
     );
   }
 }
