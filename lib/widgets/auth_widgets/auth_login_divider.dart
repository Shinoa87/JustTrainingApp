import 'package:flutter/material.dart';

 class AuthLoginDivider extends StatelessWidget {
   const AuthLoginDivider({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       width: MediaQuery
           .of(context)
           .size
           .width,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             width: MediaQuery
                 .of(context)
                 .size
                 .width * 0.4,
             decoration: BoxDecoration(
                 border: Border.all(
                   color: Colors.grey,
                 )
             ),
           ),
           SizedBox(width: MediaQuery
               .of(context)
               .size
               .width * 0.02,),
           const Text(
             'or',
             style: TextStyle(
               fontWeight: FontWeight.w400,
               fontSize: 14,
               color: Color(0xff757575),
             ),
           ),
           SizedBox(width: MediaQuery
               .of(context)
               .size
               .width * 0.02,),
           Container(
             width: MediaQuery
                 .of(context)
                 .size
                 .width * 0.4,
             decoration: BoxDecoration(
                 border: Border.all(
                     color: Colors.grey
                 )
             ),
           ),
         ],
       ),
     );
   }
 }
