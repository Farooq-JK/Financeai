import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_shell.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'Notifications', children: dummyNotifications.map((note) => AppCard(child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.notifications_active),
      title: Text(note['title'].toString()),
      subtitle: Text(note['message'].toString()),
    ))).toList());
  }
}
