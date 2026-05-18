class Exercise {
  const Exercise({
    required this.name,
    required this.detail,
    required this.icon,
  });

  final String name;
  final String detail;
  final String icon;
}

class Meal {
  const Meal({
    required this.type,
    required this.name,
    required this.calories,
  });

  final String type;
  final String name;
  final int calories;
}

class ChatMessage {
  const ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;
}
