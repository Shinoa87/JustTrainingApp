import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../models/transaction_model/transaction_model.dart';
import 'package:just_training_app/enums/enums.dart';

class CustomTransactionCategoryDropdownCard extends StatefulWidget {

  final Function(String?)? onChanged;

  const CustomTransactionCategoryDropdownCard({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTransactionCategoryDropdownCard> createState() =>
      _CustomTransactionCategoryDropdownCard();
}

class _CustomTransactionCategoryDropdownCard
    extends State<CustomTransactionCategoryDropdownCard> {
  final List<String> items = [
    TransactionCategory.salariesDev.getName,
    TransactionCategory.salariesMg.getName,
    TransactionCategory.others.getName,
    TransactionCategory.awards.getName,
    TransactionCategory.credit.getName,
    TransactionCategory.bankCharges.getName,
    TransactionCategory.dividends.getName,
    TransactionCategory.externalHr.getName,
    TransactionCategory.internalHr.getName,
    TransactionCategory.taxes.getName,
    TransactionCategory.profit.getName,
  ];

  String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        isExpanded: true,
        hint: const Text(
          'Category',
          style: TextStyle(fontSize: 14),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        scrollbarAlwaysShow: true,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        dropdownMaxHeight: 200,
        items: items
            .map((item) =>
            DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
        },
        onChanged: widget.onChanged,
        onSaved: (value) {
          selectedValue = value.toString();
        },
      ),
    );
  }
}
