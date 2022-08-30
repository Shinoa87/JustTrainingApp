import 'package:flutter/material.dart';
import 'package:just_training_app/constants/constants.dart';

class CustomTransactionDescriptionCard extends StatelessWidget {

  final String title;
  final Function(String?)? onChanged;

  const CustomTransactionDescriptionCard({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        maxLines: 4,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          label: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  title
              ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: ColorConstants.mainPurpleColor
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
