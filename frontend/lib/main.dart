import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'utils/app_constants.dart';

void main() {
  runApp(const FinanceAiApp());
}

class FinanceAiApp extends StatelessWidget {
  const FinanceAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinanceAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
      ),
      home: const SplashScreen(),
    );
  }
}
