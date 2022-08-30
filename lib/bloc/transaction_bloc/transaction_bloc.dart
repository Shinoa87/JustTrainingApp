import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../enums/enums/status_enum.dart';
import '../../models/transaction_model/transaction_model.dart';
import '../../repositories/transaction_repository/transaction_repository.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _transactionRepository;
  StreamSubscription? _transactionSubscription;

  TransactionBloc({
    required TransactionRepository transactionRepository,
  }): _transactionRepository = transactionRepository,
        super(TransactionLoading()) {
    on<AddTransaction>(_onAddTransaction);
    on<EditTransaction>(_onEditTransaction);
    on<LoadTransactions>(_onLoadTransactions);
    on<UpdateTransactions>(_onUpdateTransactions);
    on<DeleteTransaction>(_onDeleteTransaction);
    on<CompleteTransaction>(_onCompleteTransaction);
  }

  void _onUpdateTransactions(
      UpdateTransactions event,
      Emitter<TransactionState> emit,
      ) {
    emit(
      TransactionLoaded(
        transactions: event.transactions,
      ),
    );
  }

  void _onLoadTransactions(
      LoadTransactions event,
      Emitter<TransactionState> emit,
      ) {
    _transactionSubscription?.cancel();
    _transactionSubscription = _transactionRepository.getTransactions().listen((transactions) {
      add(
        UpdateTransactions(transactions: transactions,),
      );
    });
  }

  void _onAddTransaction(
    AddTransaction event,
    Emitter<TransactionState> emit,
  ){

     _transactionRepository.addTransactionToFirestore(event.transaction);

     List<Transaction> newTransactions = List.from((state as TransactionLoaded).transactions)
     ..add(event.transaction);

    if (state is TransactionLoaded) {
      emit(
        TransactionLoaded(
          transactions: newTransactions,
        ),
      );
    }
  }
  void _onEditTransaction(
      EditTransaction event,
      Emitter<TransactionState> emit,
      ){

    _transactionRepository.editTransactionOnFirestore(event.transaction);

    List<Transaction> editedTransactions = List.from((state as TransactionLoaded).transactions);

    if (state is TransactionLoaded) {
      emit(
        TransactionLoaded(
          transactions: editedTransactions,
        ),
      );
    }
  }

  void _onCompleteTransaction(
      CompleteTransaction event,
      Emitter<TransactionState> emit,
      ) async{
    if (event.transaction.status == Status.wait) {
      await _transactionRepository.changeTransactionStatus(Status.ok, event.transaction);
    }
    else{
      await _transactionRepository.changeTransactionStatus(
              Status.wait, event.transaction
          );
        }
    List<Transaction> updatedTransactions = List.from((state as TransactionLoaded).transactions);

    if (state is TransactionLoaded) {
      emit(
        TransactionLoaded(
          transactions: updatedTransactions,
        ),
      );
    }
  }

  void _onDeleteTransaction(
      DeleteTransaction event,
      Emitter<TransactionState> emit,
      ){
    _transactionRepository.deleteTransaction(event.transaction);

    if (state is TransactionLoaded) {
      emit(
        TransactionLoaded(
          transactions: List.from((state as TransactionLoaded).transactions),
        ),
      );
    }
  }
}



