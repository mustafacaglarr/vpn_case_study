import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: 0,
      onTap: (index) {},
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      items: [
        // 1. Countries
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/map.png'),
            size: 24,
          ),
          label: "Countries",
        ),

        // 2. Disconnect
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/radar.png'),
            size: 24,
          ),
          label: "Disconnect",
        ),

        // 3. Settings
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/setting.png'),
            size: 24,
          ),
          label: "Settings",
        ),
      ],
    );
  }
}
