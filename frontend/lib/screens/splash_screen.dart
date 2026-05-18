import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 118,
                height: 118,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(34),
                ),
                child: const Icon(Icons.fitness_center, color: AppColors.primary, size: 58),
              ),
              const SizedBox(height: 28),
              const Text(
                'FitAI Coach',
                style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your AI Fitness Assistant',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 70),
              AppButton(
                text: 'Get Started',
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
