from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import LeaveType, LeaveRequest, LeaveBalance

User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'first_name', 'last_name', 'is_active', 'is_admin')
        read_only_fields = ('is_active', 'is_admin')

class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'first_name', 'last_name')

    def create(self, validated_data):
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'],
            first_name=validated_data.get('first_name', ''),
            last_name=validated_data.get('last_name', ''),
            is_active=False
        )
        return user

class LeaveTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeaveType
        fields = '__all__'

class LeaveRequestSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    leave_type = LeaveTypeSerializer(read_only=True)
    leave_type_id = serializers.PrimaryKeyRelatedField(
        queryset=LeaveType.objects.filter(is_active=True),
        write_only=True,
        source='leave_type'
    )

    class Meta:
        model = LeaveRequest
        fields = ('id', 'user', 'leave_type', 'leave_type_id', 'start_date', 
                 'end_date', 'reason', 'status', 'created_at', 'updated_at')
        read_only_fields = ('user', 'status')

class LeaveBalanceSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    leave_type = LeaveTypeSerializer(read_only=True)
    remaining_days = serializers.SerializerMethodField()

    class Meta:
        model = LeaveBalance
        fields = ('id', 'user', 'leave_type', 'year', 'total_days', 
                 'used_days', 'remaining_days', 'created_at', 'updated_at')
        read_only_fields = ('user', 'total_days', 'used_days')

    def get_remaining_days(self, obj):
        return obj.total_days - obj.used_days 