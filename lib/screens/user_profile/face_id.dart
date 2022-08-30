import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class FaceId extends StatefulWidget {
   const FaceId({Key? key}) : super(key: key);

  @override
  State<FaceId> createState() => _FaceIdState();
}

class _FaceIdState extends State<FaceId> {

  bool state = false;

   @override
   Widget build(BuildContext context) {
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 15),
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.5),
             spreadRadius: 1,
             blurRadius: 1,
             offset: const Offset(0, 2),
           ),
         ],
       ),
       height: 53,
       width: double.infinity,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: const [
               Icon(
                 Icons.tag_faces,
                 size: 30,
               ),
               SizedBox(width: 7,),
               Text(
                 'Face ID',
                 style: TextStyle(
                     fontFamily: 'Montserrat',
                     fontSize: 17,
                     fontWeight: FontWeight.w600
                 ),
               ),
             ],
           ),
           CupertinoSwitch(
             value: state,
             onChanged: (value){
               state = value;
               setState(() {
               });
             },
             activeColor: const Color(0xff8A5DA5),
             trackColor: Colors.grey,
           ),
         ],
       ),
     );
   }
}
