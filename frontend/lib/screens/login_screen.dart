import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import 'dashboard_screen.dart';
import 'goal_setup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Icon(Icons.eco, color: AppColors.primary, size: 52),
              const SizedBox(height: 18),
              const Text('Welcome back', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              const Text('Login or create an account to start your fitness journey.', style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 34),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Forgot password?')),
              ),
              const SizedBox(height: 12),
              AppButton(
                text: 'Login',
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DashboardScreen())),
              ),
              const SizedBox(height: 12),
              AppButton(
                text: 'Create Account',
                isOutlined: true,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GoalSetupScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
