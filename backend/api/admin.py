from django.contrib import admin
from .models import Bill, Expense, Notification, Subscription

admin.site.register(Expense)
admin.site.register(Subscription)
admin.site.register(Bill)
admin.site.register(Notification)
