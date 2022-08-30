import 'package:flutter/material.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/constants/constants.dart';
import 'dart:io' show Platform;

 class AccountButtons extends StatelessWidget {
   const AccountButtons({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Platform.isAndroid ? Stack(
       children: [
         AuthButtonWidget(
           title: 'Sign in with Google',
           titleColour: ColorConstants.mainPurpleColor,
           buttonColour: Colors.white,
           onPressed: () {},
         ),
         const Positioned(
           left: 21,
           top: 11,
           child: Image(
             image: AssetImage('images/google_moogle.png'),
             width: 30,
             height: 30,
           ),
         ),
       ],
     ) :
     Column(
       children: [
         Stack(
           children: [
             AuthButtonWidget(
               title: 'Sign in with Google',
               titleColour: ColorConstants.mainPurpleColor,
               buttonColour: Colors.white,
               onPressed: () {
                 // await _googleSignIn.signIn();
                 // setState(() {});
               },
             ),
             const Positioned(
               left: 21,
               top: 11,
               child: Image(
                 image: AssetImage('images/google_moogle.png'),
                 width: 30,
                 height: 30,
               ),
             ),
           ],
         ),
         const SizedBox(height: 24,),
         Stack(
           children: [
             AuthButtonWidget(
               title: 'Sign in with AppleStore',
               buttonColour: Colors.black,
               titleColour: Colors.white,
               onPressed: () {},
             ),
             const Positioned(
               left: 21,
               top: 11,
               child: Icon(Icons.apple_outlined, color: Colors.white,
                   size: 30),
             ),
           ],
         ),
       ],
     );
   }
 }
