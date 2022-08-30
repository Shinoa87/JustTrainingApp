import 'package:flutter/material.dart';
import 'package:just_training_app/constants/constants.dart';

class CustomTransactionMoneyAmountCard extends StatelessWidget {
  const CustomTransactionMoneyAmountCard({
    Key? key,
    required this.title,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  final String title;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: validator,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
          label: Text(
              title
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorConstants.mainPurpleColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
