import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:fl_chart/fl_chart.dart';
import 'package:just_training_app/models/transaction_model/transaction_model.dart';
import 'package:just_training_app/models/chart_model/chart_model.dart';
import '../../enums/enums/status_enum.dart';
import '../../enums/enums/transaction_type_enum.dart';
import '../../formatters/formatters.dart';
import 'base_transaction_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class TransactionRepository extends BaseTransactionRepository{

  final FirebaseFirestore _firebaseFirestore;
  final auth.FirebaseAuth _firebaseAuth;

  TransactionRepository({FirebaseFirestore? firebaseFirestore,auth.FirebaseAuth? firebaseAuth}) :
        _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;


  @override
  Stream<List<Transaction>> getTransactions() {
    return _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('transactions')
        .snapshots()
        .map((snapshot){
      return snapshot.docs.map((doc) => Transaction.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<void> addTransactionToFirestore(Transaction transaction) async {
    String? docId = transaction.id;

    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('transactions')
        .doc(docId)
        .set(transaction.toMap());
  }
  @override
  Future<void> editTransactionOnFirestore(Transaction transaction) async {
    String? docId = transaction.id;

    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('transactions')
        .doc(docId)
        .update({
      'transactionType': transaction.transactionType,
      'category': transaction.category,
      'moneyAmount': transaction.moneyAmount,
      'date': transaction.date,
      'status': transaction.status,
      'description': transaction.description,
    });
  }

  @override
  Future<void> deleteTransaction(Transaction transaction) async{
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('transactions')
        .doc(transaction.id)
        .delete();
  }

  @override
  Future<void> changeTransactionStatus(Status newStatus, Transaction transaction) async{
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .collection('transactions')
        .doc(transaction.id)
        .update({
      'status': '$newStatus'
    });
  }

  @override
  List<BarChartGroupData> getChartData(List<Transaction> transactions) {
    List<double> listProfitSum = [0,0,0,0,0,0,0,0,0,0,0,0];
    List<double> listLossSum = [0,0,0,0,0,0,0,0,0,0,0,0];

    List<BarChartGroupData> listData = [];
      for (var transaction in transactions.where((tran) => tran.status == Status.ok)) {
        if (transaction.transactionType == TransactionType.profit) {
          listProfitSum[Formatters().getMonth(int.parse(transaction.date.substring(3,5)))-1] += transaction.moneyAmount/1000;
        } else {
          listLossSum[Formatters().getMonth(int.parse(transaction.date.substring(3,5)))-1] += transaction.moneyAmount/1000;
        }
      }

    for  (int i=1; i < 13; i++){
      BarChartGroupData chartMonthData = ChartModel(
        positiveSumcolor: const Color(0xff53fdd7),
        negativeSumcolor: const Color(0xffff5182),
      ).makeGroupData(
        i,
        listProfitSum[i-1],
        listLossSum[i-1],
      );

      listData.add(chartMonthData);
    }
    return listData;
  }
 }