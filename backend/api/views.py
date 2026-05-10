"""API views for FinanceAI.

The AI endpoints intentionally return placeholder results. In a real project,
this is where you would call the Gemini API with a secure server-side API key.
"""
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from rest_framework import status, viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Bill, Category, Expense, Notification, Subscription
from .serializers import (
    BillSerializer,
    ExpenseSerializer,
    NotificationSerializer,
    SubscriptionSerializer,
    UserSerializer,
)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all().order_by('id')
    serializer_class = UserSerializer


class ExpenseViewSet(viewsets.ModelViewSet):
    queryset = Expense.objects.all().order_by('-date')
    serializer_class = ExpenseSerializer


class SubscriptionViewSet(viewsets.ModelViewSet):
    queryset = Subscription.objects.all().order_by('next_payment_date')
    serializer_class = SubscriptionSerializer


class BillViewSet(viewsets.ModelViewSet):
    queryset = Bill.objects.all().order_by('due_date')
    serializer_class = BillSerializer


class NotificationViewSet(viewsets.ModelViewSet):
    queryset = Notification.objects.all().order_by('-created_at')
    serializer_class = NotificationSerializer


@api_view(['POST'])
def login_view(request):
    username = request.data.get('username', '')
    password = request.data.get('password', '')
    user = authenticate(username=username, password=password)
    if user is None:
        return Response({'detail': 'Invalid username or password.'}, status=status.HTTP_400_BAD_REQUEST)
    return Response({'message': 'Login successful.', 'user': UserSerializer(user).data})


@api_view(['POST'])
def ai_assistant_view(request):
    question = request.data.get('message', '')
    placeholder_answer = (
        'Gemini API placeholder: based on your manually entered data, '
        'try reviewing Shopping, Transport, Bills, and Subscriptions each week.'
    )
    return Response({'question': question, 'answer': placeholder_answer})


@api_view(['POST'])
def receipt_scan_view(request):
    return Response({
        'message': 'Receipt scan placeholder. Connect Gemini Vision or another AI API later.',
        'extracted': {
            'title': 'Sample Receipt Expense',
            'amount': '25.00',
            'category': Category.SHOPPING,
        },
    })
