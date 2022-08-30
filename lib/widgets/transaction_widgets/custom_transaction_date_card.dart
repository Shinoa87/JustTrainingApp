import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_training_app/constants/constants.dart';

class CustomTransactionDateCard extends StatefulWidget {
  final DateTime? initialDate;
  final TextEditingController selectedDateController;
  final Function(String) onDataChanged;

  const CustomTransactionDateCard({
    Key? key,
    required this.onDataChanged,
    required this.initialDate,
    required this.selectedDateController,
  }) : super(key: key);

  @override
  State<CustomTransactionDateCard> createState() => _CustomTransactionDateCardState();
}

class _CustomTransactionDateCardState extends State<CustomTransactionDateCard> {

  @override
  void initState() {
    widget.selectedDateController.text = widget.initialDate != null
        ? DateFormat('dd/MM/yyyy').format(widget.initialDate!)
        : "";
    super.initState();
  }

  @override
  void dispose() {
    widget.selectedDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        readOnly: true,
        controller: widget.selectedDateController,
        decoration: InputDecoration(
          label: Text(
            "Date",
            style: TextStyle(
              color: const Color(0xff1B1B1B).withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 18, horizontal: 23),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConstants.mainPurpleColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              builder: ((context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.dark(
                      onPrimary: Color.fromARGB(85, 27, 27, 27),
                      primary: Color(0xff8A5DA5),
                      onSurface: Color.fromARGB(255, 224, 177, 251),
                      surface: Color.fromARGB(255, 97, 69, 113),
                    ),
                    dialogBackgroundColor: const Color(0xff8A5DA5),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                  ),
                  child: child!,
                );
              }),
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2200));

          if (pickedDate != null) {
            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

            setState(() {
              widget.selectedDateController.text = formattedDate;
              widget.onDataChanged(formattedDate);
            });
          }
        },
      ),
    );
  }
}
