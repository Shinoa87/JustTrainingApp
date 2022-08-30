import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../formatters/formatters.dart';
import 'package:just_training_app/enums/enums.dart';


 class Transaction extends Equatable {
  final String? id;
  final TransactionType transactionType;
  final Status status;
  final String date;
  final TransactionCategory category;
  final int moneyAmount;
  final String description;

  const Transaction({
   this.id,
   required this.transactionType,
   required this.status,
   required this.date,
   required this.category,
   required this.moneyAmount,
   required this.description
 });

  Transaction copyWith({
   String? id,
   TransactionType? transactionType,
   Status? status,
   String? date,
   TransactionCategory? category,
   int? moneyAmount,
   String? description,
 }) {
   return Transaction(
    id:  id ?? this.id,
    transactionType:  transactionType ?? this.transactionType,
    status:  status ?? this.status,
    date:  date ?? this.date,
    category:  category ?? this.category,
    moneyAmount:  moneyAmount ?? this.moneyAmount,
    description:  description ?? this.description,
   );
  }

  Map<String, dynamic> toMap() {
   return{
    'id': id,
    'transactionType' : transactionType.toString(),
    'status':  status.toString(),
    'date':  date,
    'category':  category.toString(),
    'moneyAmount':  moneyAmount.toString(),
    'description':  description,
   };
  }

  // Map<String, dynamic>
  factory Transaction.fromSnapshot(DocumentSnapshot snap) {
   return Transaction(
    id: snap['id'],
    transactionType: Formatters().fromStringToTypeName('${snap['transactionType']}'),
    status: Formatters().fromStringToStatusName('${snap['status']}'),
    date:  snap['date'],
    category: Formatters().fromStringToCategoryName('${snap['category']}'),
    moneyAmount: int.parse('${snap['moneyAmount']}'),
    description: snap['description'],
    // transactionType: snap.data().toString().contains('transactionType') ? Formatters().fromStringToType(snap['transactionType']) : Formatters().fromStringToType('Profit'),
    // status: snap.data().toString().contains('status') ? Formatters().fromStringToStatus(snap['status']) : Formatters().fromStringToStatus('Wait'),
    // date: snap.data().toString().contains('date') ? snap['date'] : '',
    // category: snap.data().toString().contains('category') ? Formatters().fromStringToCategory(snap['category']) : Formatters().fromStringToCategory('Others'),
    // moneyAmount: snap.data().toString().contains('moneyAmount') ? int.parse('${snap['moneyAmount']}') : int.parse('0'),
    // description: snap.data().toString().contains('description') ? snap['description'] : 'misipisi',
   );
  }


  @override
  List<Object?> get props => [
   transactionType,
   status,
   date,
   category,
   moneyAmount,
   description,
  ];

  // static List<Transaction> transactions = [
  //  // Transaction(
  //  //  transactionType: 'Salaries dev.',
  //  //  status: 'wait',
  //  //  date:  DateTime.now().toString(),
  //  //  category:  TransactionCategory.dividends,
  //  //  moneyAmount: 155,
  //  //  description:  'asdasdasdadasdasdasd',
  //  // ),
  //  // Transaction(
  //  //  transactionType: 'TransactionCategory.salariesDev dev.',
  //  //  status: 'wait',
  //  //  date:  DateTime.now().toString(),
  //  //  category:  TransactionCategory.salariesDev,
  //  //  moneyAmount: 155,
  //  //  description:  'asdasdasdadasdasdasd',
  //  // ),
  //  // Transaction(
  //  //  transactionType: 'Salaries dev.',
  //  //  status: 'wait',
  //  //  date:  DateTime.now().toString(),
  //  //  category:  TransactionCategory.profit,
  //  //  moneyAmount: 155,
  //  //  description:  'asdasdasdadasdasdasd',
  //  // ),
  //  // Transaction(
  //  //  transactionType: 'Salaries dev.',
  //  //  status: 'wait',
  //  //  date:  DateTime.now().toString(),
  //  //  category:  TransactionCategory.bankCharges,
  //  //  moneyAmount: 155,
  //  //  description:  'asdasdasdadasdasdasd',
  //  // ),
  //  // Transaction(
  //  //  transactionType: 'Salaries dev.',
  //  //  status: 'wait',
  //  //  date:  DateTime.now().toString(),
  //  //  category:  TransactionCategory.salariesDev,
  //  //  moneyAmount: 155,
  //  //  description:  'asdasdasdadasdasdasd',
  //  // ),
  //  // Transaction(
  //  //  transactionType: 'Salaries dev.',
  //  //  status: 'wait',
  //  //  date:  DateTime.now().toString(),
  //  //  category:  TransactionCategory.awards,
  //  //  moneyAmount: 155,
  //  //  description:  'asdasdasdadasdasdasd',
  //  // ),
  // ];
 }
