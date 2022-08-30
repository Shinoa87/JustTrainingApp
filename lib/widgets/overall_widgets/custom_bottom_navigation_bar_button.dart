import 'package:flutter/material.dart';
import 'package:just_training_app/constants/constants.dart';

class CustomBottomNavigationBarButton extends StatelessWidget {
  const CustomBottomNavigationBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorConstants.mainPurpleColor,
      onPressed: () => Navigator.pushNamed(context, '/add_transaction'),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
