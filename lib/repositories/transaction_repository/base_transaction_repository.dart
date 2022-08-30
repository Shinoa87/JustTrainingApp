import 'package:fl_chart/fl_chart.dart';
import 'package:just_training_app/models/models.dart';
import '../../enums/enums/status_enum.dart';

 abstract class BaseTransactionRepository{
  Stream<List<Transaction>> getTransactions();
  Future<void> addTransactionToFirestore(Transaction transaction);
  Future<void> editTransactionOnFirestore(Transaction transaction);
  Future<void> deleteTransaction(Transaction transaction);
  Future<void> changeTransactionStatus(Status newStatus, Transaction transaction);
  List<BarChartGroupData> getChartData(List<Transaction> transactions);
 }