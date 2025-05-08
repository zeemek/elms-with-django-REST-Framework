from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth import get_user_model
from django.utils import timezone
from .models import LeaveType, LeaveBalance

User = get_user_model()

@receiver(post_save, sender=User)
def create_leave_balances(sender, instance, created, **kwargs):
    if created:
        current_year = timezone.now().year
        leave_types = LeaveType.objects.filter(is_active=True)
        
        for leave_type in leave_types:
            LeaveBalance.objects.create(
                user=instance,
                leave_type=leave_type,
                year=current_year,
                total_days=leave_type.maximum_days_per_year,
                used_days=0
            ) 