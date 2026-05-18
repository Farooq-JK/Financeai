import 'package:flutter/material.dart';

import '../services/ai_service.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/app_scaffold.dart';

class WorkoutPlanScreen extends StatelessWidget {
  const WorkoutPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = const AiService().generateWorkoutPlan();

    return AppScaffold(
      title: 'AI Workout Plan',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Daily beginner-friendly plan', style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 16),
          ...exercises.map(
            (exercise) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  children: [
                    Text(exercise.icon, style: const TextStyle(fontSize: 32)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(exercise.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 4),
                          Text(exercise.detail, style: const TextStyle(color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          AppButton(
            text: 'Mark as Completed',
            icon: Icons.check_circle,
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Workout completed. Great job!'))),
          ),
        ],
      ),
    );
  }
}
