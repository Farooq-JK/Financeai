import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/screen_shell.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'Bills & Reminders', children: [
      ...dummyBills.map((bill) => AppCard(child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        value: bill['paid'] as bool,
        onChanged: (_) {},
        title: Text(bill['title'].toString()),
        subtitle: Text('Due ${bill['dueDate']} • \$${bill['amount']}'),
      ))),
      const SizedBox(height: 12),
      PrimaryButton(label: 'Add Bill Reminder', onPressed: () {}),
    ]);
  }
}
