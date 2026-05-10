import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/screen_shell.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'AI Assistant', children: [
      const AppCard(child: Text('Ask a finance question. This is a Gemini API placeholder response.')),
      const SizedBox(height: 14),
      const TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Type your question', border: OutlineInputBorder())),
      const SizedBox(height: 14),
      PrimaryButton(label: 'Ask FinanceAI', onPressed: () {}),
      const SizedBox(height: 14),
      const AppCard(child: Text('FinanceAI: Review manual expenses weekly and watch subscriptions.', style: TextStyle(color: AppColors.textDark))),
    ]);
  }
}
