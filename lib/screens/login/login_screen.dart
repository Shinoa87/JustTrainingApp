import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/screens/screens.dart';
import 'package:just_training_app/constants/constants.dart';
import 'package:just_training_app/cubits/cubits.dart';
import '../../repositories/repositories.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider(create: (context) => SigninCubit(authRepository: context.read<AuthRepository>()),
        child: const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(height: 33,),
                  Image(
                    width: 170,
                    height: 170,
                    image: AssetImage(ImagesPaths.logoPath),
                  ),
                  SizedBox(height: 24,),
                  LoginForm(),
                  SizedBox(height: 24,),
                  AuthLoginDivider(),
                  SizedBox(height: 24,),
                  AccountButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
