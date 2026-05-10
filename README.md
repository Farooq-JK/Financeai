# FinanceAI

FinanceAI is an AI-powered personal finance management Android app built as a final year college project starter. Users manually add expenses, subscriptions, bills, and reminders. The project intentionally does **not** connect to bank accounts or external subscription providers such as Netflix, Disney, Spotify, or similar services.

## Main Stack

- **Frontend:** Flutter and Dart
- **Backend:** Django REST Framework
- **Database:** SQLite for development, PostgreSQL-ready settings
- **AI:** Gemini API placeholder integration for receipt scanning and assistant chat
- **DevOps:** Docker-ready backend and GitHub Actions workflow placeholder

## Included Screens

1. Splash Screen
2. Login / Sign Up
3. Dashboard
4. Add Expense
5. Receipt Scanner
6. Expenses History
7. Subscriptions
8. Analytics
9. Bills & Reminders
10. AI Assistant
11. Notifications
12. Profile / Settings

## Allowed Categories

FinanceAI only uses these categories:

- Shopping
- Transport
- Bills
- Subscriptions

Food, Entertainment, and Other are intentionally excluded.

## Folder Structure

```text
Financeai/
├── backend/
│   ├── api/                         # Django app with models, serializers, views, and routes
│   ├── financeai_backend/           # Django project settings and root URLs
│   ├── Dockerfile                   # Docker-ready development backend
│   ├── manage.py                    # Django CLI entry point
│   └── requirements.txt             # Python dependencies
├── frontend/
│   ├── lib/
│   │   ├── models/                  # Dummy data for the first working version
│   │   ├── screens/                 # 12 Flutter screens
│   │   ├── services/                # API service placeholder for Django connection
│   │   ├── utils/                   # App constants and category list
│   │   └── widgets/                 # Reusable UI widgets
│   ├── analysis_options.yaml
│   └── pubspec.yaml
└── .github/workflows/ci.yml         # CI placeholder
```

## Backend Setup

```bash
cd backend
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

The backend API will run at `http://127.0.0.1:8000/api/`.

### Backend Endpoints

- `GET/POST /api/users/`
- `POST /api/auth/login/`
- `GET/POST /api/expenses/`
- `GET/POST /api/subscriptions/`
- `GET/POST /api/bills/`
- `GET/POST /api/notifications/`
- `POST /api/ai-assistant/`
- `POST /api/receipt-scan/`

## Docker Backend Setup

```bash
cd backend
docker build -t financeai-backend .
docker run -p 8000:8000 financeai-backend
```

## Flutter Setup

```bash
cd frontend
flutter pub get
flutter run
```

When running on an Android emulator, the Flutter API service uses `http://10.0.2.2:8000/api` to reach the Django server running on your computer.

## AI Placeholder Notes

- `POST /api/receipt-scan/` returns a sample extracted receipt result.
- `POST /api/ai-assistant/` returns a sample finance tip.
- Add Gemini API calls later in `backend/api/views.py` and keep API keys on the backend, not in Flutter.

## Future Improvements

- Add token-based authentication.
- Connect Flutter forms to live Django endpoints.
- Add real image upload from Flutter to the receipt scan endpoint.
- Integrate Gemini API for receipt OCR and assistant responses.
- Add PostgreSQL configuration for production.
- Add push notifications for bill reminders.
- Add stronger analytics and monthly budget goals.
- Add unit and widget tests.
