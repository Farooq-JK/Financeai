import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_scaffold.dart';
import 'posture_result_screen.dart';

class PostureCheckScreen extends StatelessWidget {
  const PostureCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Posture Check',
      child: Column(
        children: [
          Container(
            height: 360,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.videocam_outlined, color: Colors.white, size: 76),
                SizedBox(height: 14),
                Text('Camera Preview Placeholder', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Start your exercise and let AI check your posture.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textDark),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Start Posture Check',
            icon: Icons.play_arrow,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PostureResultScreen())),
          ),
        ],
      ),
    );
  }
}
