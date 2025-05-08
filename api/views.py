from django.shortcuts import render, redirect, get_object_or_404
from rest_framework import viewsets, status, permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from django.contrib.auth import get_user_model, login, authenticate, logout
from django.utils import timezone
from django.http import HttpResponse
from django.contrib import messages
from rest_framework_simplejwt.tokens import RefreshToken
from .models import LeaveType, LeaveRequest, LeaveBalance
from .serializers import (
    UserSerializer, UserRegistrationSerializer, LeaveTypeSerializer,
    LeaveRequestSerializer, LeaveBalanceSerializer
)

User = get_user_model()

def welcome(request):
    user = request.user
    if user.is_authenticated and getattr(user, 'is_admin', False):
        # Leave Balances (for all types)
        leave_balances = [
            {
                'leave_type': lb.leave_type.name,
                'total_days': lb.total_days,
                'used_days': lb.used_days,
                'remaining': lb.total_days - lb.used_days,
            }
            for lb in LeaveBalance.objects.filter(user=user)
        ]
        # My Leave Requests
        my_leave_requests = [
            {
                'leave_type': lr.leave_type.name,
                'start_date': lr.start_date.strftime('%b %d, %Y'),
                'end_date': lr.end_date.strftime('%b %d, %Y'),
                'status': lr.status,
            }
            for lr in LeaveRequest.objects.filter(user=user)
        ]
        # Pending Leave Requests (all users)
        pending_leave_requests = [
            {
                'employee': lr.user.username,
                'leave_type': lr.leave_type.name,
                'start_date': lr.start_date.strftime('%b %d, %Y'),
                'end_date': lr.end_date.strftime('%b %d, %Y'),
                'id': lr.id,
            }
            for lr in LeaveRequest.objects.filter(status='pending')
        ]
        # All Employees
        employees = [
            {
                'id': u.id,
                'name': u.username,
                'email': u.email,
                'status': 'active' if u.is_active else 'pending',
            }
            for u in User.objects.exclude(is_admin=True)
        ]
        return render(request, 'admin_dashboard.html', {
            'leave_balances': leave_balances,
            'my_leave_requests': my_leave_requests,
            'pending_leave_requests': pending_leave_requests,
            'employees': employees,
        })
    return render(request, 'base.html')

def login_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            login(request, user)
            # Generate JWT tokens
            refresh = RefreshToken.for_user(user)
            # Store tokens in session for API requests
            request.session['access_token'] = str(refresh.access_token)
            request.session['refresh_token'] = str(refresh)
            return redirect('welcome')
        else:
            messages.error(request, 'Invalid username or password.')
    
    return render(request, 'login.html')

def register_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        password2 = request.POST.get('password2')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')

        if password != password2:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'register.html')

        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'register.html')

        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'register.html')

        user = User.objects.create_user(
            username=username,
            email=email,
            password=password,
            first_name=first_name,
            last_name=last_name
        )
        
        login(request, user)
        return redirect('welcome')

    return render(request, 'register.html')

def logout_view(request):
    logout(request)
    messages.success(request, 'You have been successfully logged out.')
    return redirect('login')

def activate_user(request, user_id):
    if request.user.is_authenticated and getattr(request.user, 'is_admin', False):
        user = get_object_or_404(User, id=user_id)
        user.is_active = True
        user.save()
        messages.success(request, f'User {user.username} activated.')
    return redirect('welcome')

def deactivate_user(request, user_id):
    if request.user.is_authenticated and getattr(request.user, 'is_admin', False):
        user = get_object_or_404(User, id=user_id)
        user.is_active = False
        user.save()
        messages.success(request, f'User {user.username} deactivated.')
    return redirect('welcome')

class IsAdminUser(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_admin

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAdminUser]

    def get_serializer_class(self):
        if self.action == 'create':
            return UserRegistrationSerializer
        return UserSerializer

    @action(detail=True, methods=['post'])
    def activate(self, request, pk=None):
        user = self.get_object()
        user.is_active = True
        user.save()
        return Response({'status': 'user activated'})

class LeaveTypeViewSet(viewsets.ModelViewSet):
    queryset = LeaveType.objects.all()
    serializer_class = LeaveTypeSerializer
    permission_classes = [IsAdminUser]

class LeaveRequestViewSet(viewsets.ModelViewSet):
    serializer_class = LeaveRequestSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        if user.is_admin:
            return LeaveRequest.objects.all()
        return LeaveRequest.objects.filter(user=user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    @action(detail=True, methods=['post'])
    def approve(self, request, pk=None):
        if not request.user.is_admin:
            return Response(
                {'error': 'Only admin can approve leave requests'},
                status=status.HTTP_403_FORBIDDEN
            )

        leave_request = self.get_object()
        if leave_request.status != 'pending':
            return Response(
                {'error': 'Leave request is not pending'},
                status=status.HTTP_400_BAD_REQUEST
            )

        leave_request.status = 'approved'
        leave_request.save()

        # Update leave balance
        leave_balance = LeaveBalance.objects.get(
            user=leave_request.user,
            leave_type=leave_request.leave_type,
            year=timezone.now().year
        )
        leave_balance.used_days += 1
        leave_balance.save()

        return Response({'status': 'leave request approved'})

    @action(detail=True, methods=['post'])
    def reject(self, request, pk=None):
        if not request.user.is_admin:
            return Response(
                {'error': 'Only admin can reject leave requests'},
                status=status.HTTP_403_FORBIDDEN
            )

        leave_request = self.get_object()
        if leave_request.status != 'pending':
            return Response(
                {'error': 'Leave request is not pending'},
                status=status.HTTP_400_BAD_REQUEST
            )

        leave_request.status = 'rejected'
        leave_request.save()

        return Response({'status': 'leave request rejected'})

class LeaveBalanceViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = LeaveBalanceSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        if user.is_admin:
            return LeaveBalance.objects.all()
        return LeaveBalance.objects.filter(user=user)
