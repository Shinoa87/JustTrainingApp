import 'package:flutter/material.dart';
import 'package:just_training_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){

    switch (settings.name){
      case '/':
        return LoginScreen.route();
      case RegistrationScreen.routeName:
        return RegistrationScreen.route();
      case UserProfileScreen.routeName:
        return UserProfileScreen.route();
      case ForgotPasswordScreen.routeName:
        return ForgotPasswordScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case AddTransactionScreen.routeName:
        return AddTransactionScreen.route();
      case EditTransactionScreen.routeName:
        return EditTransactionScreen.route();
      case ChartScreen.routeName:
        return ChartScreen.route();
      case TransactionHistoryScreen.routeName:
        return TransactionHistoryScreen.route();
      case CompletedTransactionHistoryScreen.routeName:
        return CompletedTransactionHistoryScreen.route();
      default:
        return _errorRoute();

    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Error'
          ),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }

}