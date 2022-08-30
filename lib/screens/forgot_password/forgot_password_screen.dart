import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/cubits/reset_password_cubit/reset_password_cubit.dart';
import '../../constants/constants.dart';
import '../../cubits/sign_in_cubit/signin_qubit.dart';
import '../../repositories/auth_repository/auth_repository.dart';
import '../../widgets/widgets.dart';
import '../user_profile/user_profile_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/forgot_password';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider(create: (context) => ResetPasswordCubit(authRepository: context.read<AuthRepository>()),
        child: const ForgotPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              Form(
                child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 260),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 11),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Forgot Your Password?',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff1B1B1B),
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 11),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  TextConstants.forgotText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff757575),
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24,),
                          AuthTextFormFieldWidget(
                            hintText: 'Enter email',
                            showEye: false,
                            onChanged: (value) {
                              context.read<SigninCubit>().emailChanged(value);
                            },
                          ),
                          const SizedBox(height: 24,),
                          CustomElevatedButton(
                            title: 'Reset my password',
                            buttonColour: ColorConstants.mainPurpleColor,
                            titleColour: Colors.white,
                            onPressed: () {
                              context.read<ResetPasswordCubit>().resetPassword();
                              Navigator.pushNamed(context, UserProfileScreen.routeName);
                            },
                          ),
                        ]
                    );
                  },
                ),
              ),
              const Positioned(
                top: 70,
                child: OverallArrowBack(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}