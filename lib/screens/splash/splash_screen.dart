import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/screens/screens.dart';
import 'package:just_training_app/constants/constants.dart';
import 'package:just_training_app/cubits/cubits.dart';
import '../../bloc/authentication_bloc/auth_bloc.dart';
import '../../repositories/repositories.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 1), () => Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName, ModalRoute.withName('login'),),
            );
          } else if(state.status == AuthStatus.authenticated){
            Timer(
              const Duration(seconds: 1), () => Navigator.of(context).pushNamed(UserProfileScreen.routeName),
            );
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              child: const Center(
                child: Image(
                  image: AssetImage(
                    ImagesPaths.logoPath,
                  ),
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
