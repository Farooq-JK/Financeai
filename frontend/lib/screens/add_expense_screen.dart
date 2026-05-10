import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../widgets/primary_button.dart';
import '../widgets/screen_shell.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedCategory = financeCategories.first;
    return ScreenShell(title: 'Add Expense', children: [
      const TextField(decoration: InputDecoration(labelText: 'Expense title', border: OutlineInputBorder())),
      const SizedBox(height: 14),
      const TextField(keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Amount', border: OutlineInputBorder())),
      const SizedBox(height: 14),
      DropdownButtonFormField<String>(
        value: selectedCategory,
        decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
        items: financeCategories.map((category) => DropdownMenuItem(value: category, child: Text(category))).toList(),
        onChanged: (value) => selectedCategory = value ?? financeCategories.first,
      ),
      const SizedBox(height: 14),
      const TextField(decoration: InputDecoration(labelText: 'Notes', border: OutlineInputBorder())),
      const SizedBox(height: 22),
      PrimaryButton(label: 'Save Expense', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Expense saved in demo mode')))),
    ]);
  }
}
