import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_card.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/bottom_nav.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Profile',
      showBack: false,
      bottomNavigationBar: const FitBottomNav(currentIndex: 3),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 54,
            backgroundColor: AppColors.primaryLight,
            child: Icon(Icons.person, color: AppColors.primary, size: 62),
          ),
          const SizedBox(height: 14),
          const Text('Farooq Ahmed', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          const Text('farooq@example.com', style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 24),
          _MenuItem(icon: Icons.person_outline, title: 'Personal Information', onTap: () {}),
          _MenuItem(icon: Icons.flag_outlined, title: 'My Goals', onTap: () {}),
          _MenuItem(icon: Icons.assignment_outlined, title: 'My Plans', onTap: () {}),
          _MenuItem(icon: Icons.settings_outlined, title: 'Settings', onTap: () {}),
          _MenuItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(icon, color: AppColors.primary)),
            const SizedBox(width: 14),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w800))),
            const Icon(Icons.chevron_right, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
