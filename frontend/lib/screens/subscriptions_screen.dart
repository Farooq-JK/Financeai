import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/screen_shell.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'Subscriptions', children: [
      ...dummySubscriptions.map((sub) => AppCard(child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.repeat),
        title: Text(sub['name'].toString()),
        subtitle: Text('${sub['cycle']} • next ${sub['nextDate']}'),
        trailing: Text('\$${sub['amount']}'),
      ))),
      const SizedBox(height: 12),
      PrimaryButton(label: 'Add Subscription Manually', onPressed: () {}),
    ]);
  }
}
