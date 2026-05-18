import 'package:flutter/material.dart';

import '../models/fitness_models.dart';
import '../services/ai_service.dart';
import '../utils/app_colors.dart';
import '../widgets/bottom_nav.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final controller = TextEditingController();
  final aiService = const AiService();
  final messages = <ChatMessage>[
    const ChatMessage(text: 'Hi Farooq, I’m your AI fitness coach. How can I help you today?', isUser: false),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _send([String? text]) {
    final message = (text ?? controller.text).trim();
    if (message.isEmpty) return;
    setState(() {
      messages.add(ChatMessage(text: message, isUser: true));
      messages.add(ChatMessage(text: aiService.sendChatMessage(message), isUser: false));
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('AI Coach', style: TextStyle(fontWeight: FontWeight.w900)), backgroundColor: AppColors.background, elevation: 0),
      bottomNavigationBar: const FitBottomNav(currentIndex: 2),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  _QuickChip(text: 'What should I eat today?', onTap: () => _send('What should I eat today?')),
                  _QuickChip(text: 'Best workout for beginners', onTap: () => _send('Best workout for beginners')),
                  _QuickChip(text: 'Can I train with knee pain?', onTap: () => _send('Can I train with knee pain?')),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) => _Bubble(message: messages[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Type your message...'))),
                  const SizedBox(width: 10),
                  IconButton.filled(onPressed: () => _send(), icon: const Icon(Icons.send)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  const _QuickChip({required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(label: Text(text), onPressed: onTap, backgroundColor: Colors.white),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 285),
        decoration: BoxDecoration(
          color: message.isUser ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(message.text, style: TextStyle(color: message.isUser ? Colors.white : AppColors.textDark)),
      ),
    );
  }
}
