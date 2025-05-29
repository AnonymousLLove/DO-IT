import 'package:flutter/material.dart';

class DashboardBotttomNav extends StatelessWidget {
  const DashboardBotttomNav();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(243, 250, 255, 1),
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset("assets/images/dashboard_home.png"),
              onPressed: () {},
            ),

            IconButton(
              icon: Image.asset("assets/images/dashboard_mark.png"),
              onPressed: () {},
            ),

            IconButton(
              icon: Image.asset("assets/images/profile.png"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
