import '../models/fitness_models.dart';

class AiService {
  const AiService();

  // TODO: Add Gemini API integration here when the project is ready for a real AI backend.
  List<Exercise> generateWorkoutPlan() {
    return const [
      Exercise(name: 'Warm-up', detail: '5 minutes light jogging and arm circles', icon: '🔥'),
      Exercise(name: 'Squats', detail: '3 sets of 12 reps', icon: '🏋️'),
      Exercise(name: 'Push-ups', detail: '3 sets of 10 reps', icon: '💪'),
      Exercise(name: 'Plank', detail: '3 rounds of 30 seconds', icon: '⏱️'),
      Exercise(name: 'Walking', detail: '20 minutes brisk walk', icon: '🚶'),
    ];
  }

  // TODO: Replace dummy meals with Gemini-generated meal plans later.
  List<Meal> generateMealPlan() {
    return const [
      Meal(type: 'Breakfast', name: 'Oats with banana and almonds', calories: 380),
      Meal(type: 'Lunch', name: 'Grilled chicken salad with brown rice', calories: 560),
      Meal(type: 'Dinner', name: 'Vegetable omelette with whole wheat toast', calories: 440),
      Meal(type: 'Snack', name: 'Greek yogurt with berries', calories: 180),
    ];
  }

  // TODO: Send this message to Gemini API and return the generated answer.
  String sendChatMessage(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('eat') || lower.contains('meal')) {
      return 'For today, choose lean protein, vegetables, whole grains, and drink plenty of water.';
    }
    if (lower.contains('knee')) {
      return 'If you have knee pain, avoid jumping and deep squats. Try walking, stretching, and ask a doctor if pain continues.';
    }
    if (lower.contains('beginner') || lower.contains('workout')) {
      return 'A beginner workout can include walking, squats, wall push-ups, and planks for 20-30 minutes.';
    }
    return 'Great question! This is a placeholder AI coach response. A Gemini API response can be added here later.';
  }
}
