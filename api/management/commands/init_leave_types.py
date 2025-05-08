from django.core.management.base import BaseCommand
from api.models import LeaveType

class Command(BaseCommand):
    help = 'Initialize leave types'

    def handle(self, *args, **kwargs):
        leave_types = [
            {
                'name': 'Casual Leave',
                'description': 'Regular paid time off for personal reasons',
                'maximum_days_per_year': 12,
            },
            {
                'name': 'Earned Leave',
                'description': 'Accumulated leave based on service period',
                'maximum_days_per_year': 30,
            },
        ]

        for leave_type_data in leave_types:
            LeaveType.objects.get_or_create(
                name=leave_type_data['name'],
                defaults=leave_type_data
            )

        self.stdout.write(self.style.SUCCESS('Successfully initialized leave types')) 