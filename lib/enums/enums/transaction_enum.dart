import 'package:flutter/material.dart';

enum TransactionStatus {
  complete,
  incomplete,
}

extension FormExtensionTransactionStatus on TransactionStatus {

  Icon get getIcon {
    switch (this) {
      case TransactionStatus.complete:
        return const Icon(Icons.add);
      case TransactionStatus.incomplete:
        return const Icon(Icons.close);
      default:
        return const Icon(Icons.add);
    }
  }
}