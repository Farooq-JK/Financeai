import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../utils/app_constants.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_shell.dart';

class ExpensesHistoryScreen extends StatelessWidget {
  const ExpensesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'Expenses History', children: dummyExpenses.map((expense) => AppCard(child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(expense['title'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('${expense['category']} • ${expense['date']}'),
      trailing: Text('\$${(expense['amount'] as double).toStringAsFixed(2)}', style: const TextStyle(color: AppColors.purple, fontWeight: FontWeight.bold)),
    ))).toList());
  }
}
