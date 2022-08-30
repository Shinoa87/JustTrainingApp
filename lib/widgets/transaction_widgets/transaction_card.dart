 import 'package:flutter/material.dart';
 import '../../models/transaction_model/transaction_model.dart';
 import 'custom_circle_painter.dart';
 import 'package:just_training_app/widgets/widgets.dart';
 import 'package:just_training_app/enums/enums.dart';

 class TransactionCard extends StatelessWidget {

   final Transaction transaction;
   final int index;

   const TransactionCard({
     Key? key,
     required this.transaction,
     required this.index,
   }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return ClipRRect(
       borderRadius: BorderRadius.circular(25),
       child: Container(
         decoration: BoxDecoration(
           gradient:
           LinearGradient(colors: [transaction.category.getColorLight, transaction.category.getColorMain]),
         ),
         constraints: const BoxConstraints(
           minWidth: 153,
           maxWidth: 250,
         ),
         // width: 153,
         height: 105,
         child: Stack(
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(25),
               child: Container(
                 constraints: const BoxConstraints(
                   minWidth: 153,
                   maxWidth: 200,
                 ),
                 // decoration: BoxDecoration(
                 //   gradient:
                 //   LinearGradient(colors: [transaction.category.getColorLight, transaction.category.getColorMain]),
                 // ),
                 height: 105,
                 // width: 153,
                 child: CustomPaint(
                   painter: CustomCirclePainter(transaction.category.getColorLight),
                 ),
               ),
             ),
             Container(
               padding: const EdgeInsets.only(left: 16, top: 20, bottom:20,right: 16),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     transaction.category.getName,
                     style: TextStyle(
                       fontFamily: 'Montserrat',
                       fontWeight: FontWeight.w400,
                       fontSize: 18,
                       color: transaction.category.getColorTitle,
                     ),
                   ),
                   const SizedBox(height: 14),
                   Text(
                     'P${transaction.moneyAmount}.000',
                     style: TextStyle(
                       fontFamily: 'Montserrat',
                       fontWeight: FontWeight.w700,
                       fontSize: 24,
                       color: transaction.category.getColorTitle,
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
