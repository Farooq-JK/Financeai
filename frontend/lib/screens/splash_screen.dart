import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_balance_wallet_rounded, size: 88, color: AppColors.purple),
              const SizedBox(height: 24),
              const Text('FinanceAI', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Simple AI-powered personal finance management for students.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColors.textMuted),
              ),
              const SizedBox(height: 36),
              PrimaryButton(
                label: 'Get Started',
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
