part of 'transaction_bloc.dart';

 abstract class TransactionEvent extends Equatable{
  const TransactionEvent();

  @override
   List<Object> get props => [];
 }

 class LoadTransactions extends TransactionEvent{
   final List<Transaction> transactions;

   const LoadTransactions({
     this.transactions = const <Transaction>[],
   });

   @override
   List<Object> get props => [transactions];
 }

 class UpdateTransactions extends TransactionEvent{
   final List<Transaction> transactions;

    const UpdateTransactions({
      this.transactions = const <Transaction>[],
    });

    @override
    List<Object> get props => [
      transactions,
    ];
 }

 class AddTransaction extends TransactionEvent{
   final Transaction transaction;

   const AddTransaction({required this.transaction});

   @override
   List<Object> get props => [transaction];
 }

 class EditTransaction extends TransactionEvent{
   final Transaction transaction;

   const EditTransaction({required this.transaction});

   @override
   List<Object> get props => [transaction];
 }

class DeleteTransaction extends TransactionEvent{
  final Transaction transaction;

  const DeleteTransaction({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

class CompleteTransaction extends TransactionEvent{
  final Transaction transaction;

  const CompleteTransaction({required this.transaction});

  @override
  List<Object> get props => [transaction];
}