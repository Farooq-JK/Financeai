import 'package:flutter/material.dart';

import '../models/fitness_models.dart';
import '../services/ai_service.dart';
import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/app_scaffold.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  final aiService = const AiService();
  late List<Meal> meals = aiService.generateMealPlan();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'AI Meal Plan',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dummy AI-generated meals for today', style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 16),
          ...meals.map(
            (meal) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  children: [
                    const CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(Icons.restaurant_menu, color: AppColors.primary)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(meal.type, style: const TextStyle(fontWeight: FontWeight.w900)),
                          const SizedBox(height: 4),
                          Text(meal.name, style: const TextStyle(color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    Text('${meal.calories} cal', style: const TextStyle(fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          AppButton(
            text: 'Generate New Meal Plan',
            icon: Icons.refresh,
            onPressed: () {
              setState(() => meals = aiService.generateMealPlan().reversed.toList());
            },
          ),
        ],
      ),
    );
  }
}
