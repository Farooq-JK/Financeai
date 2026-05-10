"""Database models for FinanceAI.

These models keep the first version simple: users manually add expenses,
subscriptions, and bills. No bank or streaming service accounts are connected.
"""
from django.contrib.auth.models import User
from django.db import models


class Category(models.TextChoices):
    SHOPPING = 'Shopping', 'Shopping'
    TRANSPORT = 'Transport', 'Transport'
    BILLS = 'Bills', 'Bills'
    SUBSCRIPTIONS = 'Subscriptions', 'Subscriptions'


class Expense(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='expenses')
    title = models.CharField(max_length=120)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    category = models.CharField(max_length=20, choices=Category.choices)
    date = models.DateField()
    notes = models.TextField(blank=True)
    receipt_image = models.ImageField(upload_to='receipts/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.title} - {self.amount}'


class Subscription(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='subscriptions')
    name = models.CharField(max_length=120)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    billing_cycle = models.CharField(max_length=30, default='Monthly')
    next_payment_date = models.DateField()
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class Bill(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='bills')
    title = models.CharField(max_length=120)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    due_date = models.DateField()
    is_paid = models.BooleanField(default=False)
    reminder_enabled = models.BooleanField(default=True)

    def __str__(self):
        return self.title


class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='notifications')
    title = models.CharField(max_length=120)
    message = models.TextField()
    is_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
