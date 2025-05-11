"""
URL configuration for leave_management project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from api.views import welcome, login_view, register_view, logout_view, activate_user, deactivate_user
from api.views import employee_dashboard, submit_leave_request
from api.views import approve_leave_request, reject_leave_request
from api.views import delete_employee, update_employee

urlpatterns = [
    path('', welcome, name='welcome'),
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('login/', login_view, name='login'),
    path('register/', register_view, name='register'),
    path('logout/', logout_view, name='logout'),
    path('activate-user/<int:user_id>/', activate_user, name='activate_user'),
    path('deactivate-user/<int:user_id>/', deactivate_user, name='deactivate_user'),
    path('dashboard/', employee_dashboard, name='employee_dashboard'),
    path('submit-leave/', submit_leave_request, name='submit_leave'),
    path('approve-leave/<int:leave_id>/', approve_leave_request, name='approve_leave'),
    path('reject-leave/<int:leave_id>/', reject_leave_request, name='reject_leave'),
    path('delete-employee/<int:user_id>/', delete_employee, name='delete_employee'),
    path('update-employee/<int:user_id>/', update_employee, name='update_employee'),
]
