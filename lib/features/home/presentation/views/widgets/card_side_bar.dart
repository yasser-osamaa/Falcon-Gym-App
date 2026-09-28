import 'package:flutter/material.dart';

class CardSideBar extends StatelessWidget {
  const CardSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 17, bottom: 17),
      width: 5,
      decoration: const BoxDecoration(
        color: Color(0xffB5894D),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
