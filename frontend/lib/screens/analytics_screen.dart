import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_shell.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'Analytics', children: [
      AppCard(child: SizedBox(
        height: 220,
        child: PieChart(PieChartData(sections: const [
          PieChartSectionData(value: 35, color: AppColors.purple, title: 'Shopping'),
          PieChartSectionData(value: 20, color: Colors.blue, title: 'Transport'),
          PieChartSectionData(value: 30, color: Colors.orange, title: 'Bills'),
          PieChartSectionData(value: 15, color: Colors.green, title: 'Subs'),
        ])),
      )),
      const SizedBox(height: 16),
      const AppCard(child: Text('Tip: Use analytics to compare Shopping, Transport, Bills, and Subscriptions.')),
    ]);
  }
}
