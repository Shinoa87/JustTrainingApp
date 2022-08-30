import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_training_app/repositories/repositories.dart';
import 'package:just_training_app/widgets/widgets.dart';
import 'package:just_training_app/screens/screens.dart';
import 'package:just_training_app/constants/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/user_profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const UserProfileScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height:49,),
                const Image(
                  width: 150,
                  height: 150,
                  image: AssetImage(ImagesPaths.logoPath),
                ),
                const SizedBox(height:49,),
                const UserInformation(),
                const SizedBox(height:70,),
                const FaceId(),
                const SizedBox(height:80,),
                InkWell(
                  child: const Text(
                    "Logout",
                    style:TextStyle(
                        color: Color(0xffEB5757),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat'
                    ),
                  ),
                  onTap: () {
                    RepositoryProvider.of<AuthRepository>(context).signOut();
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const CustomBottomNavigationBarButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(
        activeIndex: 3,
      ),
    );
  }
}