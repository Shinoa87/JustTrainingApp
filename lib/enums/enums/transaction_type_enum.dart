
import 'dart:ui';

import 'package:flutter/material.dart';

enum TransactionType {
  profit,
  loss
}

extension FormExtensionType on TransactionType {

  String get getName {
    switch (this) {
      case TransactionType.loss:
        return "Loss";
      case TransactionType.profit:
        return "Profit";
      default:
        return "Loss";
    }
  }

  Color get getMoneyColor {
    switch (this) {
      case TransactionType.loss:
        return Colors.red;
      case TransactionType.profit:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  String get getMoneySign {
    switch (this) {
      case TransactionType.loss:
        return '-₽';
      case TransactionType.profit:
        return '+₽';
      default:
        return '-₽';
    }
  }

  String get getFormattedMoney {
    switch (this) {
      case TransactionType.loss:
        return '';
      case TransactionType.profit:
        return '.000';
      default:
        return '';
    }
  }
}