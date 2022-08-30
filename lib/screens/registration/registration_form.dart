import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/constants/constants.dart';
import 'package:just_training_app/cubits/cubits.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/screens/screens.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Column(
          children: [
            AuthTextFormFieldWidget(
              hintText: 'Username',
              showEye: false,
              onChanged: (value) {
                context.read<SignupCubit>().usernameChanged(value);
              },
            ),
            const SizedBox(height:24),
            AuthTextFormFieldWidget(
              hintText: 'Email',
              showEye: false,
              onChanged: (value) {
                context.read<SignupCubit>().emailChanged(value);
              },
            ),
            const SizedBox(height:24),
            AuthPasswordFormFieldWidget(
              hintText: 'Password',
              showEye: true,
              onChanged: (value) {
                context.read<SignupCubit>().passwordChanged(value);
              },
            ),
            const SizedBox(height:24),
            const AuthPasswordFormFieldWidget(
              hintText: 'Confirm password',
              showEye: true,
            ),
            const SizedBox(height:24),
            AuthButtonWidget(
              title: 'Register',
              titleColour: Colors.white,
              buttonColour: ColorConstants.mainPurpleColor,
              onPressed: () async{
                await context.read<SignupCubit>().signupWithCredentials();
                Navigator.pushNamed(context, UserProfileScreen.routeName);
              } ,
            ),
          ],
        );
      }
    );
  }
}
