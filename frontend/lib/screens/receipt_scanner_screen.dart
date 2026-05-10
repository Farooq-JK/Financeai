import 'package:flutter/material.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/screen_shell.dart';

class ReceiptScannerScreen extends StatelessWidget {
  const ReceiptScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(title: 'Receipt Scanner', children: [
      const AppCard(child: Column(children: [
        Icon(Icons.document_scanner_outlined, size: 72),
        SizedBox(height: 12),
        Text('Upload or capture a receipt image.'),
        Text('AI extraction is a Gemini API placeholder for now.'),
      ])),
      const SizedBox(height: 16),
      PrimaryButton(label: 'Choose Image / Camera', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image picker placeholder')))),
      const SizedBox(height: 12),
      PrimaryButton(label: 'Run AI Receipt Extraction', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Gemini placeholder extracted sample expense')))),
    ]);
  }
}
