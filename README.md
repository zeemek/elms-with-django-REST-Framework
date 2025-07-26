# Employee Leave Management System

A web-based Employee Leave Management System built with Django REST Framework where registered employees can apply for leaves and administrators manage approvals.

## Features

- User Registration & Activation
- Leave Request Management
- Leave Balance Tracking
- Reports Generation
- Role-based Access Control

## Technology Stack

- Django 5.0.2
- Django REST Framework 3.14.0
- JWT Authentication
- MySQL Database

## Setup Instructions

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Configure database:
- Create a MySQL database named 'elms'
- Update database settings in settings.py if needed

4. Run migrations:
```bash
python manage.py migrate
```

5. Create superuser:
```bash
python manage.py createsuperuser
```

6. Run the development server:
```bash
python manage.py runserver
```

## API Endpoints

### Authentication
- POST /api/auth/register/ - Register new user
- POST /api/auth/login/ - Login user
- POST /api/auth/refresh/ - Refresh JWT token

### Leave Management
- GET /api/leaves/ - List leave requests
- POST /api/leaves/ - Create leave request
- GET /api/leaves/{id}/ - Get leave request details
- PUT /api/leaves/{id}/ - Update leave request
- DELETE /api/leaves/{id}/ - Delete leave request

### Leave Balance
- GET /api/leave-balances/ - Get leave balances
- GET /api/leave-balances/{id}/ - Get specific leave balance

### Admin Endpoints
- GET /api/admin/users/ - List all users
- PUT /api/admin/users/{id}/activate/ - Activate user
- GET /api/admin/reports/ - Generate reports 


##
username: test
password: test123
email: test@gmail.com    role: admin

test2   laidaba123
test3   test123 
test4   test123

## License

This project is licensed under the [MIT License](./LICENSE).  
You are free to use, modify, and distribute this code in any project (including commercial use),  
but you **must retain the license and credit the original author**.

### Attribution
Author: **Leishangthem Michael Meitei**  
GitHub: [github.com/zeemek](https://github.com/zeemek)

