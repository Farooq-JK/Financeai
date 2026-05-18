import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_card.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/bottom_nav.dart';
import 'ai_chat_screen.dart';
import 'goal_setup_screen.dart';
import 'meal_plan_screen.dart';
import 'posture_check_screen.dart';
import 'progress_tracker_screen.dart';
import 'workout_plan_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showBack: false,
      bottomNavigationBar: const FitBottomNav(currentIndex: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Farooq', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                  SizedBox(height: 4),
                  Text('Ready for a healthy day?', style: TextStyle(color: AppColors.textMuted)),
                ],
              ),
              IconButton.filled(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GoalSetupScreen())),
                icon: const Icon(Icons.tune),
              ),
            ],
          ),
          const SizedBox(height: 22),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Today’s Summary', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Expanded(child: _SummaryItem(label: 'Calories left', value: '520', icon: Icons.local_fire_department)),
                    Expanded(child: _SummaryItem(label: 'Workout minutes', value: '35', icon: Icons.timer)),
                    Expanded(child: _SummaryItem(label: 'Goal progress', value: '62%', icon: Icons.flag)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.05,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _FeatureCard(title: 'Workout Plan', icon: Icons.fitness_center, onTap: () => _go(context, const WorkoutPlanScreen())),
              _FeatureCard(title: 'Meal Plan', icon: Icons.restaurant_menu, onTap: () => _go(context, const MealPlanScreen())),
              _FeatureCard(title: 'Progress', icon: Icons.show_chart, onTap: () => _go(context, const ProgressTrackerScreen())),
              _FeatureCard(title: 'AI Coach', icon: Icons.smart_toy_outlined, onTap: () => _go(context, const AiChatScreen())),
              _FeatureCard(title: 'Posture Check', icon: Icons.accessibility_new, onTap: () => _go(context, const PostureCheckScreen())),
            ],
          ),
        ],
      ),
    );
  }

  static void _go(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(icon, color: AppColors.primary)),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.title, required this.icon, required this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 28, backgroundColor: AppColors.primaryLight, child: Icon(icon, color: AppColors.primary, size: 30)),
          const SizedBox(height: 14),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}
