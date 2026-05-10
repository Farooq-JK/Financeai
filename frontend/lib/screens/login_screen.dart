import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/primary_button.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 40),
            const Text('Login / Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Demo form for user authentication.', style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 28),
            const TextField(decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder())),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Continue',
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
