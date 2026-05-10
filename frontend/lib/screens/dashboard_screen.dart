import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../utils/app_constants.dart';
import '../widgets/app_card.dart';
import 'add_expense_screen.dart';
import 'ai_assistant_screen.dart';
import 'analytics_screen.dart';
import 'bills_screen.dart';
import 'expenses_history_screen.dart';
import 'notifications_screen.dart';
import 'profile_settings_screen.dart';
import 'receipt_scanner_screen.dart';
import 'subscriptions_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final total = dummyExpenses.fold<double>(0, (sum, item) => sum + (item['amount'] as double));
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Dashboard'), backgroundColor: Colors.white, foregroundColor: AppColors.textDark, elevation: 0),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Total tracked this month', style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 8),
              Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.purple)),
            ])),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _tile(context, 'Add Expense', Icons.add_card, const AddExpenseScreen()),
                _tile(context, 'Receipt Scanner', Icons.document_scanner, const ReceiptScannerScreen()),
                _tile(context, 'History', Icons.history, const ExpensesHistoryScreen()),
                _tile(context, 'Subscriptions', Icons.repeat, const SubscriptionsScreen()),
                _tile(context, 'Analytics', Icons.pie_chart, const AnalyticsScreen()),
                _tile(context, 'Bills', Icons.event_note, const BillsScreen()),
                _tile(context, 'AI Assistant', Icons.smart_toy, const AiAssistantScreen()),
                _tile(context, 'Notifications', Icons.notifications, const NotificationsScreen()),
                _tile(context, 'Profile', Icons.person, const ProfileSettingsScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(BuildContext context, String title, IconData icon, Widget screen) {
    return AppCard(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: AppColors.purple, size: 34),
        const SizedBox(height: 10),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700)),
      ]),
    );
  }
}
