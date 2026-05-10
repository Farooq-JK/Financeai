import 'package:flutter/material.dart';
import '../widgets/app_card.dart';
import '../widgets/screen_shell.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenShell(title: 'Profile / Settings', children: [
      AppCard(child: ListTile(leading: Icon(Icons.person), title: Text('Student User'), subtitle: Text('student@example.com'))),
      AppCard(child: SwitchListTile(value: true, onChanged: null, title: Text('Bill reminders'))),
      AppCard(child: ListTile(leading: Icon(Icons.info_outline), title: Text('No bank or subscription accounts are connected.'))),
    ]);
  }
}
