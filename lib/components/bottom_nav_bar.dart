import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;

  const BottomNavBar({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/movies_icon.svg',
            color: Colors.blue,
            height: 40,
          ),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/tv_icon.svg',
            color: Colors.blue,
            height: 40,
          ),
          label: 'TV',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/profile_icon.svg',
            color: Colors.blue,
            height: 40,
          ),
          label: 'Profile',
        ),
      ],
      onTap: onTap,
    );
  }
}
