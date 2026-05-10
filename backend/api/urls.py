"""API route definitions for the Flutter app."""
from django.urls import include, path
from rest_framework.routers import DefaultRouter
from .views import (
    BillViewSet,
    ExpenseViewSet,
    NotificationViewSet,
    SubscriptionViewSet,
    UserViewSet,
    ai_assistant_view,
    login_view,
    receipt_scan_view,
)

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'expenses', ExpenseViewSet)
router.register(r'subscriptions', SubscriptionViewSet)
router.register(r'bills', BillViewSet)
router.register(r'notifications', NotificationViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('auth/login/', login_view, name='login'),
    path('ai-assistant/', ai_assistant_view, name='ai-assistant'),
    path('receipt-scan/', receipt_scan_view, name='receipt-scan'),
]
