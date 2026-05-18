import 'package:flutter/material.dart';

import '../services/posture_service.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/app_scaffold.dart';

class PostureResultScreen extends StatelessWidget {
  const PostureResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const result = PostureResult(
      score: 78,
      backPosition: 'Good',
      kneePosition: 'Needs Improvement',
      balance: 'Good',
      depth: 'Good',
    );

    return AppScaffold(
      title: 'Posture Result',
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 170,
                height: 170,
                child: CircularProgressIndicator(
                  value: result.score / 100,
                  strokeWidth: 16,
                  backgroundColor: AppColors.primaryLight,
                  color: AppColors.primary,
                ),
              ),
              Text('${result.score}%', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Good Job!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(height: 20),
          _ResultCard(title: 'Back Position', value: result.backPosition, isGood: true),
          _ResultCard(title: 'Knee Position', value: result.kneePosition, isGood: false),
          _ResultCard(title: 'Balance', value: result.balance, isGood: true),
          _ResultCard(title: 'Depth', value: result.depth, isGood: true),
          const SizedBox(height: 16),
          AppButton(text: 'Done', onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.title, required this.value, required this.isGood});
  final String title;
  final String value;
  final bool isGood;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        child: Row(
          children: [
            Icon(isGood ? Icons.check_circle : Icons.info, color: isGood ? AppColors.primary : AppColors.warning),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w800))),
            Text(value, style: const TextStyle(color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }
}
