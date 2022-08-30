 part of 'transaction_bloc.dart';

 abstract class TransactionState extends Equatable{
   const TransactionState();

   @override
   List<Object> get props => [];
 }

 class TransactionLoading extends TransactionState{}

 class TransactionLoaded extends TransactionState{
   final List<Transaction> transactions;

   const TransactionLoaded({
     this.transactions = const <Transaction>[],
   });

   @override
   List<Object> get props => [
     transactions,
   ];
 }