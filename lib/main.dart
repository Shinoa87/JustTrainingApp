import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/repositories/repositories.dart';
import 'package:just_training_app/screens/screens.dart';
import 'package:just_training_app/bloc/bloc.dart';
import 'config/app_router.dart';
import 'package:firebase_core/firebase_core.dart';


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MultiRepositoryProvider(
       providers: [
         RepositoryProvider(
           create: (context) => AuthRepository(),
         ),
         RepositoryProvider(
           create: (context) => TransactionRepository(),
         ),
       ],
       child: MultiBlocProvider(
         providers: [
           BlocProvider(
             create: (context) => AuthBloc(context.read<AuthRepository>()),
           ),
           BlocProvider(
             create: (context) => TransactionBloc(transactionRepository: TransactionRepository())
               ..add(
                 const LoadTransactions(),
               ),
           ),
         ],
         child: const MaterialApp(
           debugShowCheckedModeBanner: false,
           onGenerateRoute: AppRouter.onGenerateRoute,
           initialRoute: SplashScreen.routeName,
         ),
       ),
     );
   }
 }

