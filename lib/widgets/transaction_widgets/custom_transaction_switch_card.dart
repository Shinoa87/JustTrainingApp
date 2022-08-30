import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomTransactionSwitchCard extends StatefulWidget {
   const CustomTransactionSwitchCard({
     Key? key,
     required this.titleSwitchName,
     required this.firstSwitchName,
     required this.secondSwitchName,
     required this.onToggle,
   }) : super(key: key);

   final String titleSwitchName;
   final String firstSwitchName;
   final String secondSwitchName;
   final void Function(int?)? onToggle;

   @override
   State<CustomTransactionSwitchCard> createState() => _CustomTransactionSwitchCardState();
 }

 class _CustomTransactionSwitchCardState extends State<CustomTransactionSwitchCard> {
   @override
   Widget build(BuildContext context) {
     return Container(
       width: double.infinity,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             padding: EdgeInsets.only(left:20),
             child: Text(
               widget.titleSwitchName,
               style: TextStyle(
                 color: const Color(0xff1B1B1B).withOpacity(0.5),
                 fontSize: 14,
                 fontWeight : FontWeight.w400,
                 fontFamily: 'Nunito',
               ),
             ),
           ),
           ToggleSwitch(
             minWidth: double.infinity,
             minHeight:64,
             totalSwitches: 2,
             labels: [widget.firstSwitchName, widget.secondSwitchName],
             cornerRadius: 10.0,
             onToggle: widget.onToggle,
             activeBgColors: [
               [const Color(0xff8A5DA5).withOpacity(0.5)],
               [const Color(0xff8A5DA5).withOpacity(0.5)],
             ],
             inactiveBgColor: Colors.white,
             borderColor: const [
               Color(0xff8A5DA5),
             ],
             borderWidth: 0.5,
             activeFgColor: const Color(0xff8A5DA5),
             inactiveFgColor: const Color(0xff8A5DA5),
             radiusStyle: true,
             initialLabelIndex: 0,
           ),
         ],
       ),
     );
   }
 }
