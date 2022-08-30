import 'package:flutter/material.dart';

class TransactionAppbar extends StatefulWidget {
  const TransactionAppbar({Key? key}) : super(key: key);

  @override
  State<TransactionAppbar> createState() => _TransactionAppbarState();
}

class _TransactionAppbarState extends State<TransactionAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff8A5DA5),
            Color(0xff2c4260),
            // Color(0xff1998CF),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(65),
          bottomRight: Radius.circular(65),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:10,bottom:10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 33,
              child: const Text(
                '<       Jule 2022      >',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 33,
              child: const Text(
                'Your total expenses',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Р900.000',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
