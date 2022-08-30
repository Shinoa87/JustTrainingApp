import 'package:flutter/material.dart';

 class AuthTextFormFieldWidget extends StatefulWidget {
   const AuthTextFormFieldWidget({Key? key,
     required this.hintText,
     required this.showEye,
     this.controller,
     this.onChanged,
     this.validator
    }) : super(key: key);

   final String hintText;
   final bool showEye;
   final TextEditingController? controller;
   final String? Function(String?)? validator;
   final Function(String)? onChanged;

  @override
  State<AuthTextFormFieldWidget> createState() => _AuthTextFormFieldWidgetState();
}

class _AuthTextFormFieldWidgetState extends State<AuthTextFormFieldWidget> {

  bool _showPassword = true;

   @override
   Widget build(BuildContext context) {

     return TextFormField(
       autovalidateMode: AutovalidateMode.onUserInteraction,
       validator: widget.validator,
       obscureText: !_showPassword,
       onChanged: widget.onChanged,
       decoration: InputDecoration(
         contentPadding: EdgeInsets.all(20.0),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
         ),
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: Colors.purple,
           ),
           borderRadius: BorderRadius.circular(10),
         ),
         disabledBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: Colors.grey,
           ),
           borderRadius: BorderRadius.circular(10),
         ),
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: Colors.purple,
           ),
           borderRadius: BorderRadius.circular(10),
         ),
         hintText: widget.hintText,
         hintStyle: const TextStyle(
           fontSize: 14,
           fontWeight: FontWeight.w400,
         ),
         suffixIcon: widget.showEye ? GestureDetector(
           onTap: () {
             _togglevisibility();
           },
           child: Icon(
             Icons.visibility_sharp,
             color: _showPassword ? const Color(0xff8A5DA5) : const Color(0xff757575),
           ),
         ) : null,
       ),
     );
   }

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
