import 'package:flutter/material.dart';

import '../models/fitness_profile.dart';
import '../services/app_state.dart';
import '../services/local_storage_service.dart';
import '../widgets/app_button.dart';
import '../widgets/app_scaffold.dart';
import 'workout_plan_screen.dart';

class GoalSetupScreen extends StatefulWidget {
  const GoalSetupScreen({super.key});

  @override
  State<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends State<GoalSetupScreen> {
  final ageController = TextEditingController(text: '22');
  final heightController = TextEditingController(text: '175');
  final weightController = TextEditingController(text: '78');
  String goal = 'Lose weight';
  String workoutDays = '4 days';
  String dietPreference = 'Balanced';

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Goal Setup',
      child: Column(
        children: [
          TextField(controller: ageController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Age', prefixIcon: Icon(Icons.cake_outlined))),
          const SizedBox(height: 14),
          TextField(controller: heightController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Height (cm)', prefixIcon: Icon(Icons.height))),
          const SizedBox(height: 14),
          TextField(controller: weightController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Weight (kg)', prefixIcon: Icon(Icons.monitor_weight_outlined))),
          const SizedBox(height: 14),
          _Dropdown(label: 'Fitness goal', value: goal, values: const ['Lose weight', 'Build muscle', 'Improve stamina', 'Stay healthy'], onChanged: (value) => setState(() => goal = value)),
          const SizedBox(height: 14),
          _Dropdown(label: 'Workout days per week', value: workoutDays, values: const ['3 days', '4 days', '5 days', '6 days'], onChanged: (value) => setState(() => workoutDays = value)),
          const SizedBox(height: 14),
          _Dropdown(label: 'Diet preference', value: dietPreference, values: const ['Balanced', 'Vegetarian', 'High protein', 'Low carb'], onChanged: (value) => setState(() => dietPreference = value)),
          const SizedBox(height: 24),
          AppButton(
            text: 'Generate My Plan',
            icon: Icons.auto_awesome,
            onPressed: () {
              final profile = FitnessProfile(
                age: ageController.text,
                height: heightController.text,
                weight: weightController.text,
                goal: goal,
                workoutDays: workoutDays,
                dietPreference: dietPreference,
              );
              AppState.fitnessProfile = profile;
              LocalStorageService.saveFitnessProfile(profile);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WorkoutPlanScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown({required this.label, required this.value, required this.values, required this.onChanged});

  final String label;
  final String value;
  final List<String> values;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      items: values.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: (selected) {
        if (selected != null) onChanged(selected);
      },
    );
  }
}
