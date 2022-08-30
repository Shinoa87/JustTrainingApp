import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int activeIndex;
  const CustomBottomNavigationBar({
    Key? key,
    required this.activeIndex
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  var tabItems = const [
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.person_outline_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: tabItems.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Colors.white.withOpacity(0.2): const Color(0xff8A5DA5);
        return CircleAvatar(
          backgroundColor: color,
          child: Icon(
            tabItems[index],
            size: 24,
            color: Colors.white,
          ),
        );
      },
      backgroundColor: const Color(0xff8A5DA5),
      activeIndex: widget.activeIndex,
      splashColor: Colors.green,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.smoothEdge,
      gapLocation: GapLocation.center,
      // leftCornerRadius: 32,
      // rightCornerRadius: 32,
      onTap: (index) => setState(() => _onBottomButtonTap(index)),
      shadow: const BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: Colors.grey,
      ),
    );
  }

  void _onBottomButtonTap(index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/chart');
        return;
      case 1:
        Navigator.pushNamed(context, '/completed_transaction_history');
        return;
      case 2:
        Navigator.pushNamed(context, '/transaction_history');
        return;
      case 3:
        Navigator.pushNamed(context, '/user_profile');
        return;
    }
  }
}


