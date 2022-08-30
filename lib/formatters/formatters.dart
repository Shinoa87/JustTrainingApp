import 'package:just_training_app/enums/enums.dart';

class Formatters {

  TransactionCategory fromStringToCategory(String? value) {
    switch (value) {
      case'Salaries dev.':
        return TransactionCategory.salariesDev;
      case'Salaries mg.':
        return TransactionCategory.salariesMg;
      case'Internal HR':
        return TransactionCategory.internalHr;
      case'External HR':
        return TransactionCategory.externalHr;
      case'Credit':
        return TransactionCategory.credit;
      case'Dividends':
        return TransactionCategory.dividends;
      case'Bank Charges':
        return TransactionCategory.bankCharges;
      case'Taxes':
        return TransactionCategory.taxes;
      case'Awards':
        return TransactionCategory.awards;
      case'Profit':
        return TransactionCategory.profit;
      case'Others':
        return TransactionCategory.others;
      default:
        return TransactionCategory.others;
    }
  }

  TransactionCategory fromStringToCategoryName(String? value) {
    switch (value) {
      case'TransactionCategory.salariesDev':
        return TransactionCategory.salariesDev;
      case'TransactionCategory.salariesMg':
        return TransactionCategory.salariesMg;
      case'TransactionCategory.internalHr':
        return TransactionCategory.internalHr;
      case'TransactionCategory.externalHr':
        return TransactionCategory.externalHr;
      case'TransactionCategory.credit':
        return TransactionCategory.credit;
      case'TransactionCategory.dividends':
        return TransactionCategory.dividends;
      case'TransactionCategory.bankCharges':
        return TransactionCategory.bankCharges;
      case'TransactionCategory.taxes':
        return TransactionCategory.taxes;
      case'TransactionCategory.awards':
        return TransactionCategory.awards;
      case'TransactionCategory.profit':
        return TransactionCategory.profit;
      case'TransactionCategory.others':
        return TransactionCategory.others;
      default:
        return TransactionCategory.others;
    }
  }

  TransactionType fromStringToType(String? value) {
    switch (value) {
      case 'Profit':
        return TransactionType.profit;
      case 'Loss':
        return TransactionType.loss;
      default:
        return TransactionType.loss;
    }
  }

  TransactionType fromStringToTypeName(String? value) {
    switch (value) {
      case 'TransactionType.profit':
        return TransactionType.profit;
      case 'TransactionType.loss':
        return TransactionType.loss;
      default:
        return TransactionType.loss;
    }
  }

  Status fromStringToStatus(String? value) {
    switch (value) {
      case 'Wait':
        return Status.wait;
      case 'Ok':
        return Status.ok;
      default:
        return Status.wait;
    }
  }

  Status fromStringToStatusName(String? value) {
    switch (value) {
      case 'Status.wait':
        return Status.wait;
      case 'Status.ok':
        return Status.ok;
      default:
        return Status.wait;
    }
  }
  
  int getFormatMoney(int value) {
    return int.parse('$value.000');
  }

  int getMonth(int monthNumber) {
    switch (monthNumber) {
      case 01:
        return 1;
      case 02:
        return 2;
      case 03:
        return 3;
      case 04:
        return 4;
      case 05:
        return 5;
      case 06:
        return 6;
      case 07:
        return 7;
      case 08:
        return 8;
      case 09:
        return 9;
      case 10:
        return 10;
      case 11:
        return 11;
      case 12:
        return 12;
      default:
        return 1;
    }
  }
}