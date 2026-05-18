import 'package:flutter/material.dart';

import '../screens/ai_chat_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/progress_tracker_screen.dart';
import '../screens/profile_screen.dart';
import '../utils/app_colors.dart';

class FitBottomNav extends StatelessWidget {
  const FitBottomNav({super.key, required this.currentIndex});

  final int currentIndex;

  void _openTab(BuildContext context, int index) {
    if (index == currentIndex) return;

    final pages = <Widget>[
      const DashboardScreen(),
      const ProgressTrackerScreen(),
      const AiChatScreen(),
      const ProfileScreen(),
    ];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => _openTab(context, index),
      backgroundColor: Colors.white,
      indicatorColor: AppColors.primaryLight,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.show_chart), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.smart_toy_outlined), selectedIcon: Icon(Icons.smart_toy), label: 'Coach'),
        NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
