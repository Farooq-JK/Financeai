// Dummy data lets the first Flutter version run before connecting Django.
final dummyExpenses = [
  {'title': 'New backpack', 'amount': 45.00, 'category': 'Shopping', 'date': '2026-05-01'},
  {'title': 'Metro card', 'amount': 18.50, 'category': 'Transport', 'date': '2026-05-03'},
  {'title': 'Electric bill', 'amount': 62.25, 'category': 'Bills', 'date': '2026-05-05'},
  {'title': 'Cloud storage', 'amount': 9.99, 'category': 'Subscriptions', 'date': '2026-05-07'},
];

final dummySubscriptions = [
  {'name': 'Cloud Storage', 'amount': 9.99, 'cycle': 'Monthly', 'nextDate': '2026-06-01'},
  {'name': 'Study App', 'amount': 12.00, 'cycle': 'Monthly', 'nextDate': '2026-06-05'},
];

final dummyBills = [
  {'title': 'Electric Bill', 'amount': 62.25, 'dueDate': '2026-05-18', 'paid': false},
  {'title': 'Internet Bill', 'amount': 40.00, 'dueDate': '2026-05-22', 'paid': false},
];

final dummyNotifications = [
  {'title': 'Bill reminder', 'message': 'Electric Bill is due soon.'},
  {'title': 'Budget tip', 'message': 'Review your Shopping expenses this week.'},
];
