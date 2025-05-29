import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromRGBO(243, 250, 255, 1),
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/home.png"),
          Image.asset("assets/images/mark.png"),
          Image.asset("assets/images/profile.png"),
        ],
      ),
    );
  }
}
