import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_card.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/bottom_nav.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Progress Tracker',
      showBack: Navigator.canPop(context),
      bottomNavigationBar: const FitBottomNav(currentIndex: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(child: _ProgressInfo(title: 'Current weight', value: '78 kg')),
              SizedBox(width: 12),
              Expanded(child: _ProgressInfo(title: 'Target weight', value: '72 kg')),
            ],
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Weekly progress chart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                const SizedBox(height: 18),
                SizedBox(
                  height: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _Bar(day: 'Mon', height: 72),
                      _Bar(day: 'Tue', height: 98),
                      _Bar(day: 'Wed', height: 66),
                      _Bar(day: 'Thu', height: 118),
                      _Bar(day: 'Fri', height: 90),
                      _Bar(day: 'Sat', height: 132),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const AppCard(child: _MetricRow(label: 'Calories goal', value: '1,900 kcal/day', icon: Icons.local_fire_department)),
          const SizedBox(height: 12),
          const AppCard(child: _MetricRow(label: 'Workouts completed this week', value: '4 of 5', icon: Icons.check_circle_outline)),
          const SizedBox(height: 22),
          AppButton(text: 'Add Progress', icon: Icons.add, onPressed: () {}),
        ],
      ),
    );
  }
}

class _ProgressInfo extends StatelessWidget {
  const _ProgressInfo({required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.day, required this.height});
  final String day;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(width: 24, height: height, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10))),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
      ],
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: AppColors.primaryLight, child: Icon(icon, color: AppColors.primary)),
        const SizedBox(width: 14),
        Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700))),
        Text(value, style: const TextStyle(color: AppColors.textMuted)),
      ],
    );
  }
}
