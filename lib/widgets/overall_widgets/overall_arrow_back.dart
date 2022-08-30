import 'package:flutter/material.dart';
import 'package:just_training_app/constants/constants.dart';

 class OverallArrowBack extends StatelessWidget {
   const OverallArrowBack({Key? key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Container(
       padding: const EdgeInsets.only(left: 3),
       alignment: Alignment.centerLeft,
       child: InkWell(
         onTap: (){
           Navigator.pop(context);
         },
         child: CircleAvatar(
           backgroundColor: ColorConstants.mainPurpleColor.withOpacity(0.5),
           radius: 20,
           child: const Icon(
             Icons.arrow_back,
             color: Colors.white,
           ),
         ),
       ),
     );
   }
 }
