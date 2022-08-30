import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/constants/constants.dart';
import 'package:just_training_app/screens/screens.dart';
import 'package:just_training_app/cubits/cubits.dart';

 class LoginForm extends StatefulWidget {
   const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

   TextEditingController loginController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return BlocBuilder<SigninCubit, SigninState>(
       builder: (context, state) {
         return Column(
           children: [
             AuthTextFormFieldWidget(
               hintText: 'Username or email',
               showEye: false,
               onChanged: (value) {
                 context.read<SigninCubit>().emailChanged(value);
               },
             ),
             const SizedBox(height: 24),
             AuthPasswordFormFieldWidget(
               hintText: 'Password',
               showEye: true,
               onChanged: (value) {
                 context.read<SigninCubit>().passwordChanged(value);
               },
             ),
             const SizedBox(height: 6,),
             Container(
               alignment: Alignment.centerLeft,
               child: GestureDetector(
                 onTap: () =>
                     Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                 child: const Text(
                   'Forgot Password?',
                   style: TextStyle(
                     fontSize: 14,
                     fontWeight: FontWeight.w400,
                     color: ColorConstants.mainPurpleColor,
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 24,),
             AuthButtonWidget(
               title: 'Login',
               titleColour: ColorConstants.mainPurpleColor,
               buttonColour: Colors.white,
               onPressed: () {
                 context.read<SigninCubit>().signinWithCredentials();
                 Navigator.pushNamed(context, UserProfileScreen.routeName);
               } ,
             ),
             const SizedBox(height: 24,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text(
                   'Don’t have an account?',
                   style: TextStyle(
                     fontWeight: FontWeight.w400,
                     fontSize: 14,
                     color: Color(0xff757575),
                   ),
                 ),
                 GestureDetector(
                   onTap: () =>
                       Navigator.pushNamed(context, RegistrationScreen.routeName,),
                   child: const Text(
                     ' Sign up',
                     style: TextStyle(
                       fontWeight: FontWeight.w400,
                       fontSize: 14,
                       color: ColorConstants.mainPurpleColor,
                     ),
                   ),
                 ),
               ],
             ),
           ],
         );
       }
     );
   }
}
