import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/screens/screens.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/cubits/cubits.dart';
import '../../repositories/repositories.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const String routeName = '/registration';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider(create: (context) => SignupCubit(authRepository: context.read<AuthRepository>()),
        child: const RegistrationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Column(
                  children: const[
                    SizedBox(height: 103,),
                    Image(
                      width: 170,
                      height: 170,
                      image: AssetImage('images/logo.png',),
                    ),
                    SizedBox(height: 24,),
                    RegistrationForm(),
                  ],
                ),
                const Positioned(
                  top:36,
                  left:10,
                  child: OverallArrowBack()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
