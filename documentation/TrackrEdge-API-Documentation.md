# TrackrEdge API Documentation

## How to Use
- For all actionable steps, workflows, and development tasks, refer to the [TrackrEdge Prompt List](TrackrEdge-Prompt-List.md).
- All changes and implementations should be logged in `prompt-log.json` as per the prompt list instructions.
- This ensures consistency and traceability for all API work.

## 1. Authentication

### 1.1 Login
```http
POST /api/v1/auth/login
Content-Type: application/json

{
    "username": "string",
    "password": "string",
    "remember_me": boolean
}
```

#### Response
```json
{
    "token": "string",
    "user": {
        "id": "integer",
        "username": "string",
        "email": "string",
        "full_name": "string",
        "role": "string"
    }
}
```

#### Error Codes
- 400: Invalid credentials
- 401: Unauthorized
- 429: Too many attempts

### 1.2 Logout
```http
POST /api/v1/auth/logout
Authorization: Bearer {token}
```

## 2. Project Management

### 2.1 List Projects
```http
GET /api/v1/projects
Authorization: Bearer {token}
Query Parameters:
  - status: string (optional)
  - client_id: integer (optional)
  - product_id: integer (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "description": "string",
            "status": "string",
            "client": {
                "id": "integer",
                "name": "string"
            },
            "product": {
                "id": "integer",
                "name": "string"
            },
            "progress": "decimal",
            "estimated_hours": "decimal"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 2.2 Create Project
```http
POST /api/v1/projects
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "start_date": "date",
    "end_date": "date",
    "client_id": "integer",
    "product_id": "integer",
    "estimated_hours": "decimal"
}
```

### 2.3 Update Project
```http
PUT /api/v1/projects/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "status": "string",
    "estimated_hours": "decimal"
}
```

### 2.4 Clone Project
```http
POST /api/v1/projects/{id}/clone
Authorization: Bearer {token}
Content-Type: application/json

{
    "new_name": "string",
    "new_description": "string", // optional, defaults to source project description
    "new_start_date": "date", // optional, defaults to source project start date
    "new_end_date": "date", // optional, defaults to source project end date
    "include_phases": boolean, // optional, defaults to true
    "include_tasks": boolean, // optional, defaults to true
    "include_team_members": boolean // optional, defaults to true
}
```

#### Response
```json
{
    "id": "integer", // ID of the new cloned project
    "name": "string",
    "description": "string",
    "client": {
        "id": "integer",
        "name": "string"
    },
    "product": {
        "id": "integer",
        "name": "string"
    },
    "status": "string",
    "phases_count": "integer",
    "tasks_count": "integer",
    "team_members_count": "integer"
}
```

### 2.5 Project Team Management

#### 2.5.1 List Project Team Members
```http
GET /api/v1/projects/{project_id}/team
Authorization: Bearer {token}
Query Parameters:
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "username": "string",
            "full_name": "string",
            "role": {
                "id": "integer",
                "name": "string"
            },
            "department": "string",
            "assigned_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 2.5.2 Add Team Members to Project
```http
POST /api/v1/projects/{project_id}/team
Authorization: Bearer {token}
Content-Type: application/json

{
    "user_ids": [integer] // Array of user IDs to add to the project
}
```

#### 2.5.3 Remove Team Member from Project
```http
DELETE /api/v1/projects/{project_id}/team/{user_id}
Authorization: Bearer {token}
```

### 2.6 Project Phases

#### 2.6.1 List Phases
```http
GET /api/v1/projects/{project_id}/phases
Authorization: Bearer {token}
```

#### 2.6.2 Create Phase
```http
POST /api/v1/projects/{project_id}/phases
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "start_date": "date",
    "end_date": "date",
    "position": "integer"
}
```

#### 2.6.3 Update Phase
```http
PUT /api/v1/projects/{project_id}/phases/{phase_id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "start_date": "date",
    "end_date": "date",
    "status": "string",
    "position": "integer"
}
```

#### 2.6.4 Delete Phase
```http
DELETE /api/v1/projects/{project_id}/phases/{phase_id}
Authorization: Bearer {token}
```

#### 2.6.5 Assign Task to Phase
```http
PUT /api/v1/projects/{project_id}/tasks/{task_id}/assign-phase
Authorization: Bearer {token}
Content-Type: application/json

{
    "phase_id": "integer"
}
```

## 3. Task Management

### 3.1 List Tasks
```http
GET /api/v1/projects/{project_id}/tasks
Authorization: Bearer {token}
Query Parameters:
  - status: string (optional)
  - phase_id: integer (optional)
  - tag_ids: integer[] (optional) - Filter by multiple tags
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "title": "string",
            "status": "string",
            "phase_id": "integer",
            "tags": [
                {
                    "id": "integer",
                    "name": "string",
                    "color": "string"
                }
            ]
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 3.2 Create Task
```http
POST /api/v1/projects/{project_id}/tasks
Authorization: Bearer {token}
Content-Type: application/json

{
    "title": "string",
    "description": "string",
    "phase_id": "integer",
    "estimated_hours": "decimal",
    "tag_ids": [integer]  // Array of tag IDs
}
```

### 3.3 Update Task
```http
PUT /api/v1/projects/{project_id}/tasks/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "title": "string",
    "description": "string",
    "status": "string",
    "phase_id": "integer",
    "estimated_hours": "decimal",
    "tag_ids": [integer]  // Array of tag IDs
}
```

### 3.4 Get Task Details
```http
GET /api/v1/projects/{project_id}/tasks/{id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "id": "integer",
    "title": "string",
    "description": "string",
    "status": "string",
    "phase_id": "integer",
    "estimated_hours": "decimal",
    "tags": [
        {
            "id": "integer",
            "name": "string",
            "color": "string"
        }
    ]
}
```

## 4. Time Management

### 4.1 Log Time
```http
POST /api/v1/time-entries
Authorization: Bearer {token}
Content-Type: application/json

{
    "task_id": "integer",
    "hours": "decimal",
    "entry_date": "date",
    "notes": "string",
    "is_billable": "boolean"
}
```

### 4.2 Update Time Entry
```http
PUT /api/v1/time-entries/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
            "hours": "decimal",
    "entry_date": "date",
    "notes": "string",
    "is_billable": "boolean"
}
```

### 4.3 Delete Time Entry
```http
DELETE /api/v1/time-entries/{id}
Authorization: Bearer {token}
```

### 4.4 Get User Timesheet
```http
GET /api/v1/users/{user_id}/timesheet
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - status: string (optional)
```

#### Response
```json
{
    "week_info": {
        "start_date": "date",
        "end_date": "date",
    "status": "string",
        "total_hours": "decimal",
        "is_compliant": "boolean"
    },
    "entries": [
        {
            "task_id": "integer",
            "task_name": "string",
            "project_id": "integer",
            "project_name": "string",
            "hours": {
                "monday": "decimal",
                "tuesday": "decimal",
                "wednesday": "decimal",
                "thursday": "decimal",
                "friday": "decimal",
                "saturday": "decimal",
                "sunday": "decimal"
            },
            "is_billable": "boolean",
            "notes": "string"
        }
    ],
    "daily_totals": {
        "monday": "decimal",
        "tuesday": "decimal",
        "wednesday": "decimal",
        "thursday": "decimal",
        "friday": "decimal",
        "saturday": "decimal",
        "sunday": "decimal"
    }
}
```

### 4.5 Bulk Edit Time Entries
```http
POST /api/v1/bulk-time-entries
Authorization: Bearer {token}
Content-Type: application/json

{
    "user_id": "integer",
    "start_date": "date",
    "end_date": "date",
    "entries": [
{
    "task_id": "integer",
            "days": ["monday", "tuesday"], 
    "hours": "decimal",
            "is_billable": "boolean"
        }
    ]
}
```

### 4.6 Clone Previous Week
```http
POST /api/v1/users/{user_id}/timesheet/clone
Authorization: Bearer {token}
Content-Type: application/json

{
    "source_week_start": "date",
    "target_week_start": "date",
    "options": {
        "include_tasks": "boolean",
        "include_hours": "boolean",
        "include_notes": "boolean"
    }
}
```

### 4.7 Check 40-Hour Compliance
```http
GET /api/v1/users/{user_id}/timesheet/compliance
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
```

#### Response
```json
{
    "total_hours": "decimal",
    "is_compliant": "boolean",
    "max_hours": "integer",
    "daily_totals": {
        "monday": "decimal",
        "tuesday": "decimal",
        "wednesday": "decimal",
        "thursday": "decimal",
        "friday": "decimal",
        "saturday": "decimal",
        "sunday": "decimal"
    }
}
```

### 4.8 Submit Timesheet
```http
POST /api/v1/users/{user_id}/timesheet/submit
Authorization: Bearer {token}
Content-Type: application/json

{
    "start_date": "date",
    "end_date": "date"
}
```

### 4.9 Approve Timesheet
```http
POST /api/v1/users/{user_id}/timesheet/approve
Authorization: Bearer {token}
Content-Type: application/json

{
    "start_date": "date",
    "end_date": "date",
    "comments": "string"
}
```

### 4.10 Request Timesheet Changes
```http
POST /api/v1/users/{user_id}/timesheet/request-changes
Authorization: Bearer {token}
Content-Type: application/json

{
    "start_date": "date",
    "end_date": "date",
    "comments": "string",
    "requested_changes": [
        {
            "day": "string",
            "task_id": "integer",
            "issue": "string"
        }
    ]
}
```

## 5. Client & Product Management

### 5.1 Client Management

#### 5.1.1 List Clients
```http
GET /api/v1/clients
Authorization: Bearer {token}
Query Parameters:
  - search: string (optional)
  - status: string (optional, values: "active", "inactive")
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "contact_person": "string",
            "email": "string",
            "phone": "string",
            "address": "string",
            "status": "string",
            "project_count": "integer"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 5.1.2 Get Client Details
```http
GET /api/v1/clients/{id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "id": "integer",
    "name": "string",
    "contact_person": "string",
    "email": "string",
    "phone": "string",
    "address": "string",
    "status": "string",
    "created_at": "datetime",
    "modified_at": "datetime"
}
```

#### 5.1.3 Create Client
```http
POST /api/v1/clients
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "contact_person": "string",
    "email": "string",
    "phone": "string",
    "address": "string",
    "status": "string"
}
```

#### 5.1.4 Update Client
```http
PUT /api/v1/clients/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "contact_person": "string",
    "email": "string",
    "phone": "string",
    "address": "string",
    "status": "string"
}
```

#### 5.1.5 Delete Client
```http
DELETE /api/v1/clients/{id}
Authorization: Bearer {token}
```

#### 5.1.6 List Client Projects
```http
GET /api/v1/clients/{id}/projects
Authorization: Bearer {token}
Query Parameters:
  - status: string (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "status": "string",
    "start_date": "date",
    "end_date": "date",
            "progress": "decimal"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 5.1.7 List Client Products
```http
GET /api/v1/clients/{id}/products
Authorization: Bearer {token}
Query Parameters:
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "category": "string",
            "price": "decimal",
            "status": "string"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 5.1.8 Assign Products to Client
```http
POST /api/v1/clients/{id}/products
Authorization: Bearer {token}
Content-Type: application/json

{
    "product_ids": [
        "integer",
        "integer"
    ]
}
```

#### 5.1.9 Remove Product from Client
```http
DELETE /api/v1/clients/{client_id}/products/{product_id}
Authorization: Bearer {token}
```

### 5.2 Product Management

#### 5.2.1 List Products
```http
GET /api/v1/products
Authorization: Bearer {token}
Query Parameters:
  - search: string (optional)
  - category: string (optional)
  - status: string (optional, values: "active", "inactive")
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
    "name": "string",
            "category": "string",
    "description": "string",
            "price": "decimal",
            "status": "string",
            "project_count": "integer"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 5.2.2 Get Product Details
```http
GET /api/v1/products/{id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "id": "integer",
    "name": "string",
    "category": "string",
    "description": "string",
    "price": "decimal",
    "status": "string",
    "created_at": "datetime",
    "modified_at": "datetime"
}
```

#### 5.2.3 Create Product
```http
POST /api/v1/products
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "category": "string",
    "description": "string",
    "price": "decimal",
    "status": "string"
}
```

#### 5.2.4 Update Product
```http
PUT /api/v1/products/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "category": "string",
    "description": "string",
    "price": "decimal",
    "status": "string"
}
```

#### 5.2.5 Delete Product
```http
DELETE /api/v1/products/{id}
Authorization: Bearer {token}
```

#### 5.2.6 List Product Projects
```http
GET /api/v1/products/{id}/projects
Authorization: Bearer {token}
Query Parameters:
  - status: string (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "status": "string",
            "client": {
                "id": "integer",
                "name": "string"
            },
            "start_date": "date",
            "end_date": "date",
            "progress": "decimal"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 5.2.7 List Product Clients
```http
GET /api/v1/products/{id}/clients
Authorization: Bearer {token}
Query Parameters:
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "contact_person": "string",
            "email": "string",
            "status": "string"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 5.2.8 Assign Clients to Product
```http
POST /api/v1/products/{id}/clients
Authorization: Bearer {token}
Content-Type: application/json

{
    "client_ids": [
        "integer",
        "integer"
    ]
}
```

#### 5.2.9 Remove Client from Product
```http
DELETE /api/v1/products/{product_id}/clients/{client_id}
Authorization: Bearer {token}
```

### 5.3 Product Categories

#### 5.3.1 List Product Categories
```http
GET /api/v1/product-categories
Authorization: Bearer {token}
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "product_count": "integer"
        }
    ]
}
```

#### 5.3.2 Create Product Category
```http
POST /api/v1/product-categories
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string"
}
```

#### 5.3.3 Update Product Category
```http
PUT /api/v1/product-categories/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string"
}
```

#### 5.3.4 Delete Product Category
```http
DELETE /api/v1/product-categories/{id}
Authorization: Bearer {token}
```

## 6. Role Cost Management

### 6.1 Get Role Cost Settings
```http
GET /api/v1/roles/{role_id}/cost
Authorization: Bearer {token}
Required Permission: view_cost_data
```

### 6.2 Update Role Cost Settings
```http
PUT /api/v1/roles/{role_id}/cost
Authorization: Bearer {token}
Required Permission: manage_cost_data
Content-Type: application/json

{
    "hourly_rate": "decimal",
    "daily_rate": "decimal",
    "standard_hours": "integer",
    "effective_from": "date"
}
```

### 6.3 Get Role Cost History
```http
GET /api/v1/roles/{role_id}/cost/history
Authorization: Bearer {token}
Required Permission: view_cost_data
Query Parameters:
  - start_date: date (optional)
  - end_date: date (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

### 6.4 Get Timesheet Cost Summary
```http
GET /api/v1/users/{user_id}/timesheet/cost
Authorization: Bearer {token}
Required Permission: view_cost_data
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
```

### 6.5 Get Project Cost Report
```http
GET /api/v1/projects/{project_id}/cost
Authorization: Bearer {token}
Required Permission: view_cost_data
Query Parameters:
  - start_date: date (optional)
  - end_date: date (optional)
  - group_by: string (optional, values: "role", "user", "phase", "task")
```

## 7. User Management

### 7.1 List Users
```http
GET /api/v1/users
Authorization: Bearer {token}
Query Parameters:
  - role_id: integer (optional)
  - status: string (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "username": "string",
            "email": "string",
            "full_name": "string",
            "role": {
                "id": "integer",
                "name": "string"
            },
            "department": "string",
            "status": "string",
            "has_custom_rate": "boolean",
            "created_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 7.2 Create User
```http
POST /api/v1/users
Authorization: Bearer {token}
Content-Type: application/json

{
    "username": "string",
    "email": "string",
    "full_name": "string",
    "password": "string",
    "role_id": "integer",
    "department": "string",
    "hourly_rate": "decimal", // Optional - if not provided, role rate is used
    "daily_rate": "decimal",  // Optional - if not provided, role rate is used
    "standard_hours": "integer" // Optional - if not provided, role setting is used
}
```

### 7.3 Update User
```http
PUT /api/v1/users/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "email": "string",
    "full_name": "string",
    "role_id": "integer",
    "department": "string",
    "status": "string",
    "hourly_rate": "decimal", // Optional
    "daily_rate": "decimal",  // Optional
    "standard_hours": "integer" // Optional
}
```

### 7.4 Get User Details
```http
GET /api/v1/users/{id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "id": "integer",
    "username": "string",
    "email": "string",
    "full_name": "string",
    "role": {
        "id": "integer",
        "name": "string"
    },
    "department": "string",
    "status": "string",
    "hourly_rate": "decimal",
    "daily_rate": "decimal",
    "standard_hours": "integer",
    "rate_source": "string", // "user" or "role"
    "created_at": "datetime",
    "modified_at": "datetime"
}
```

### 7.5 Update User Cost Settings
```http
PUT /api/v1/users/{id}/cost
Authorization: Bearer {token}
Required Permission: manage_cost_data
Content-Type: application/json

{
    "hourly_rate": "decimal",
    "daily_rate": "decimal",
    "standard_hours": "integer",
    "effective_from": "date"
}
```

### 7.6 Remove User Custom Cost Settings
```http
DELETE /api/v1/users/{id}/cost
Authorization: Bearer {token}
Required Permission: manage_cost_data
```

### 7.7 Get User Cost History
```http
GET /api/v1/users/{id}/cost/history
Authorization: Bearer {token}
Required Permission: view_cost_data
Query Parameters:
  - start_date: date (optional)
  - end_date: date (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

### 7.8 Get User Effective Rate
```http
GET /api/v1/users/{id}/effective-rate
Authorization: Bearer {token}
Required Permission: view_cost_data
```

## 8. Roles & Permissions

### 8.1 List Roles
```http
GET /api/v1/roles
Authorization: Bearer {token}
```

### 8.2 Get Role Permissions
```http
GET /api/v1/roles/{id}/permissions
Authorization: Bearer {token}
```

## 9. Quick Log & Templates

### 9.1 Quick Log Time Entry
```http
POST /api/v1/quick-log
Authorization: Bearer {token}
Content-Type: application/json

{
    "task_id": "integer",
    "hours": "decimal",
    "date": "date", // defaults to current date if not provided
    "notes": "string", // optional
    "is_billable": "boolean" // defaults to true if not provided
}
```

#### Response
```json
{
    "id": "integer",
    "task_id": "integer",
    "task_name": "string",
    "project_id": "integer",
    "project_name": "string",
    "hours": "decimal",
    "entry_date": "date",
    "status": "string",
    "is_billable": "boolean"
}
```

### 9.2 List Recent Tasks
```http
GET /api/v1/users/me/recent-tasks
Authorization: Bearer {token}
Query Parameters:
  - limit: integer (default: 5)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "title": "string",
            "project_id": "integer",
            "project_name": "string",
            "last_used": "datetime"
        }
    ]
}
```

### 9.3 List Templates
```http
GET /api/v1/timesheet-templates
Authorization: Bearer {token}
Query Parameters:
  - type: string (optional, values: "personal", "team", "standard")
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "description": "string",
            "type": "string",
            "created_by": {
                "id": "integer",
                "name": "string"
            },
            "created_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 9.4 Create Template
```http
POST /api/v1/timesheet-templates
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "type": "string", // "personal" or "team"
    "source_week_start": "date", // optional, uses current week if not provided
    "entries": [ // optional, can provide custom entries instead of using source week
        {
            "task_id": "integer",
            "days": ["monday", "tuesday"], 
            "hours": "decimal",
            "is_billable": "boolean"
        }
    ]
}
```

### 9.5 Get Template Details
```http
GET /api/v1/timesheet-templates/{id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "id": "integer",
    "name": "string",
    "description": "string",
    "type": "string",
    "created_by": {
        "id": "integer",
        "name": "string"
    },
    "entries": [
        {
            "task_id": "integer",
            "task_name": "string",
            "project_id": "integer",
            "project_name": "string",
            "hours": {
                "monday": "decimal",
                "tuesday": "decimal",
                "wednesday": "decimal",
                "thursday": "decimal",
                "friday": "decimal",
                "saturday": "decimal",
                "sunday": "decimal"
            },
            "is_billable": "boolean"
        }
    ],
    "created_at": "datetime",
    "last_used": "datetime"
}
```

### 9.6 Apply Template
```http
POST /api/v1/timesheet-templates/{id}/apply
Authorization: Bearer {token}
Content-Type: application/json

{
    "target_week_start": "date",
    "replace_existing": "boolean" // whether to remove existing entries for the week
}
```

### 9.7 Update Template
```http
PUT /api/v1/timesheet-templates/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "entries": [
        {
            "task_id": "integer",
            "days": ["monday", "tuesday"], 
            "hours": "decimal",
            "is_billable": "boolean"
        }
    ]
}
```

### 9.8 Delete Template
```http
DELETE /api/v1/timesheet-templates/{id}
Authorization: Bearer {token}
```

## 10. Progressive Web App

### 10.1 Offline Time Entries Sync
```http
POST /api/v1/sync/time-entries
Authorization: Bearer {token}
Content-Type: application/json

{
    "entries": [
        {
            "local_id": "string", // client-generated ID for tracking
            "task_id": "integer",
            "hours": "decimal",
            "entry_date": "date",
            "notes": "string",
            "is_billable": "boolean",
            "created_at": "datetime" // local creation timestamp
        }
    ]
}
```

#### Response
```json
{
    "synced": [
        {
            "local_id": "string",
            "server_id": "integer",
            "status": "string"
        }
    ],
    "failed": [
        {
            "local_id": "string",
            "error": "string"
        }
    ]
}
```

### 10.2 Get App Manifest
```http
GET /manifest.json
```

#### Response
```json
{
    "name": "TrackrEdge",
    "short_name": "TrackrEdge",
    "start_url": "/",
    "display": "standalone",
    "background_color": "#111133",
    "theme_color": "#5E60CE",
    "icons": [
        {
            "src": "/icons/icon-192x192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "/icons/icon-512x512.png",
            "sizes": "512x512",
            "type": "image/png"
        }
    ]
}
```

## 11. Financial Reporting

### 11.1 P&L Trend Analysis
```http
GET /api/v1/reports/pnl/trends
Authorization: Bearer {token}
Required Permission: view_financial_data
Query Parameters:
  - project_id: integer (optional)
  - client_id: integer (optional)
  - start_date: date (required)
  - end_date: date (required)
  - period: string (optional, values: "week", "month", "quarter", default: "month")
```

#### Response
```json
{
    "data": [
        {
            "period": "string", // e.g., "May 2024"
            "revenue": "decimal",
            "costs": "decimal",
            "profit": "decimal",
            "margin_percentage": "decimal",
            "breakdown": {
                "labor_costs": "decimal",
                "expenses": "decimal"
            }
        }
    ],
    "totals": {
        "revenue": "decimal",
        "costs": "decimal",
        "profit": "decimal",
        "margin_percentage": "decimal"
    }
}
```

### 11.2 Project Profitability Analysis
```http
GET /api/v1/reports/profitability
Authorization: Bearer {token}
Required Permission: view_financial_data
Query Parameters:
  - threshold: decimal (optional, default: 20.0) - profit margin percentage threshold
  - status: string (optional, values: "all", "at_risk", "healthy", default: "all")
  - client_id: integer (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "project_id": "integer",
            "project_name": "string",
            "client_name": "string",
            "total_revenue": "decimal",
            "total_costs": "decimal",
            "total_profit": "decimal",
            "margin_percentage": "decimal",
            "status": "string", // "at_risk", "healthy", "critical"
            "trend": "string", // "improving", "declining", "stable"
            "forecast_margin": "decimal"
        }
    ],
    "summary": {
        "total_projects": "integer",
        "at_risk_count": "integer",
        "critical_count": "integer",
        "average_margin": "decimal"
    },
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 11.3 Earned Value Management Metrics
```http
GET /api/v1/projects/{project_id}/evm
Authorization: Bearer {token}
Required Permission: view_financial_data
Query Parameters:
  - as_of_date: date (optional, default: current date)
```

#### Response
```json
{
    "project": {
        "id": "integer",
        "name": "string"
    },
    "as_of_date": "date",
    "metrics": {
        "planned_value": "decimal",
        "earned_value": "decimal",
        "actual_cost": "decimal",
        "budget_at_completion": "decimal",
        "spi": "decimal",
        "cpi": "decimal",
        "eac": "decimal",
        "etc": "decimal",
        "vac": "decimal"
    },
    "timeline": [
        {
            "date": "date",
            "pv": "decimal",
            "ev": "decimal",
            "ac": "decimal"
        }
    ],
    "performance_status": {
        "schedule": "string", // "ahead", "on_track", "behind"
        "cost": "string" // "under_budget", "on_budget", "over_budget"
    }
}
```

### 11.4 Financial KPI Dashboard Data
```http
GET /api/v1/reports/financial-kpi
Authorization: Bearer {token}
Required Permission: view_financial_data
Query Parameters:
  - period: string (optional, values: "week", "month", "quarter", "year", default: "month")
  - start_date: date (optional)
  - end_date: date (optional)
```

#### Response
```json
{
    "period": {
        "start_date": "date",
        "end_date": "date",
        "label": "string"
    },
    "kpis": {
        "overall_margin": "decimal",
        "utilization_rate": "decimal",
        "billable_ratio": "decimal",
        "realization_rate": "decimal",
        "average_hourly_rate": "decimal"
    },
    "top_projects": [
        {
            "id": "integer",
            "name": "string",
            "margin": "decimal",
            "revenue": "decimal"
        }
    ],
    "top_clients": [
        {
            "id": "integer",
            "name": "string",
            "margin": "decimal",
            "revenue": "decimal"
        }
    ],
    "department_performance": [
        {
            "department": "string",
            "utilization": "decimal",
            "billable_ratio": "decimal",
            "revenue": "decimal"
        }
    ]
}
```

### 11.5 Export Financial Data
```http
POST /api/v1/reports/financial-export
Authorization: Bearer {token}
Required Permission: export_financial_data
Content-Type: application/json

{
    "format": "string", // "quickbooks", "csv", "excel", "custom"
    "date_range": {
        "start_date": "date",
        "end_date": "date"
    },
    "filters": {
        "projects": ["integer"], // optional array of project IDs
        "clients": ["integer"], // optional array of client IDs
        "include_unbilled": "boolean", // optional, default: false
        "include_cost_details": "boolean" // optional, default: false
    },
    "gl_mappings": { // optional, for accounting system exports
        "revenue_account": "string",
        "labor_cost_account": "string",
        "expense_account": "string"
    }
}
```

#### Response
```json
{
    "export_id": "string",
    "status": "string", // "processing", "completed", "failed"
    "file_url": "string", // URL to download the export file when completed
    "expires_at": "datetime", // when the exported file will expire
    "record_count": "integer"
}
```

### 11.6 Get Export Status
```http
GET /api/v1/reports/financial-export/{export_id}
Authorization: Bearer {token}
Required Permission: export_financial_data
```

#### Response
```json
{
    "export_id": "string",
    "status": "string", // "processing", "completed", "failed"
    "progress": "integer", // percentage complete (0-100)
    "file_url": "string", // URL to download the export file when completed
    "expires_at": "datetime", // when the exported file will expire
    "record_count": "integer",
    "error": "string" // only present if status is "failed"
}
```

## 12. Notifications

### 12.1 Get User Notifications
```http
GET /api/v1/notifications
Authorization: Bearer {token}
Query Parameters:
  - is_read: boolean (optional)
  - type: string (optional, values: "timesheet", "project", "task", "user", "system")
  - priority: string (optional, values: "high", "medium", "low", "info")
  - limit: integer (default: 20)
  - page: integer (default: 1)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "title": "string",
            "message": "string",
            "type": "string",
            "priority": "string",
            "entity_type": "string",
            "entity_id": "integer",
            "action_url": "string",
            "action_text": "string",
            "is_read": "boolean",
            "created_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    },
    "unread_count": "integer"
}
```

### 12.2 Get Notification
```http
GET /api/v1/notifications/{id}
Authorization: Bearer {token}
```

### 12.3 Mark Notification as Read
```http
PUT /api/v1/notifications/{id}/read
Authorization: Bearer {token}
```

### 12.4 Mark All Notifications as Read
```http
PUT /api/v1/notifications/read-all
Authorization: Bearer {token}
```

### 12.5 Delete Notification
```http
DELETE /api/v1/notifications/{id}
Authorization: Bearer {token}
```

### 12.6 Get Notification Settings
```http
GET /api/v1/notification-settings
Authorization: Bearer {token}
```

#### Response
```json
{
    "settings": [
        {
            "notification_type": "string",
            "in_app_enabled": "boolean",
            "email_enabled": "boolean"
        }
    ]
}
```

### 12.7 Update Notification Settings
```http
PUT /api/v1/notification-settings
Authorization: Bearer {token}
Content-Type: application/json

{
    "settings": [
        {
            "notification_type": "string",
            "in_app_enabled": "boolean",
            "email_enabled": "boolean"
        }
    ]
}
```

## 13. Audit Log

### 13.1 Get Audit Log
```http
GET /api/v1/audit-log
Authorization: Bearer {token}
Required Permission: view_audit_log
Query Parameters:
  - entity_type: string (optional)
  - entity_id: integer (optional)
  - action: string (optional)
  - user_id: integer (optional)
  - start_date: date (optional)
  - end_date: date (optional)
  - page: integer (default: 1)
  - limit: integer (default: 20)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "entity_type": "string",
            "entity_id": "integer",
            "action": "string",
            "user": {
                "id": "integer",
                "username": "string",
                "full_name": "string"
            },
            "ip_address": "string",
            "details": "object",
            "created_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 13.2 Get Audit Log Entry
```http
GET /api/v1/audit-log/{id}
Authorization: Bearer {token}
Required Permission: view_audit_log
```

#### Response
```json
{
    "id": "integer",
    "entity_type": "string",
    "entity_id": "integer",
    "action": "string",
    "user": {
        "id": "integer",
        "username": "string",
        "full_name": "string"
    },
    "ip_address": "string",
    "user_agent": "string",
    "details": "object",
    "before_state": "object",
    "after_state": "object",
    "created_at": "datetime"
}
```

### 13.3 Export Audit Log
```http
POST /api/v1/audit-log/export
Authorization: Bearer {token}
Required Permission: export_audit_log
Content-Type: application/json

{
    "format": "string", // "csv", "excel", "pdf"
    "filters": {
        "entity_type": "string", // optional
        "entity_id": "integer", // optional
        "action": "string", // optional
        "user_id": "integer", // optional
        "start_date": "date", // optional
        "end_date": "date" // optional
    }
}
```

#### Response
```json
{
    "export_id": "string",
    "status": "string", // "processing", "completed", "failed"
    "file_url": "string" // Only present when status is "completed"
}
```

## 14. Exports

### 14.1 Create Export Job
```http
POST /api/v1/exports
Authorization: Bearer {token}
Content-Type: application/json

{
    "export_type": "string", // "report", "timesheet", "project", etc.
    "format": "string", // "pdf", "excel", "csv"
    "parameters": {
        // Export type specific parameters
    }
}
```

#### Response
```json
{
    "export_id": "string",
    "status": "string", // "pending", "processing", "completed", "failed"
    "created_at": "datetime"
}
```

### 14.2 Get Export Status
```http
GET /api/v1/exports/{export_id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "export_id": "string",
    "export_type": "string",
    "format": "string",
    "status": "string", // "pending", "processing", "completed", "failed"
    "progress": "integer", // percentage complete (0-100)
    "file_url": "string", // URL to download the export file when completed
    "error_message": "string", // only present if status is "failed"
    "expires_at": "datetime", // when the exported file will expire
    "created_at": "datetime",
    "completed_at": "datetime"
}
```

### 14.3 List User Exports
```http
GET /api/v1/exports
Authorization: Bearer {token}
Query Parameters:
  - status: string (optional, values: "pending", "processing", "completed", "failed")
  - export_type: string (optional)
  - format: string (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "export_id": "string",
            "export_type": "string",
            "format": "string",
            "status": "string",
            "file_url": "string",
            "expires_at": "datetime",
            "created_at": "datetime",
            "completed_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 14.4 Delete Export
```http
DELETE /api/v1/exports/{export_id}
Authorization: Bearer {token}
```

## 15. Advanced Reporting

TrackrEdge provides a comprehensive reporting platform that enables data-driven decision making across all aspects of the system. The reporting API is divided into three main categories:

### 15.1 Time-Related Reports

#### 15.1.1 Time Summary Report
```http
GET /api/v1/reports/time/summary
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - group_by: string (optional, values: "user", "project", "client", "task", "day", "week", "month")
  - user_ids: array of integers (optional)
  - project_ids: array of integers (optional)
  - client_ids: array of integers (optional)
  - include_non_billable: boolean (optional, default: true)
```

#### Response
```json
{
    "data": [
        {
            "group_value": "string", // Name of the group (user name, project name, etc.)
            "group_id": "integer", // ID of the group (user ID, project ID, etc.)
            "total_hours": "decimal",
            "billable_hours": "decimal",
            "non_billable_hours": "decimal",
            "billable_percentage": "decimal",
            "period": "string" // Only present when grouping by time period
        }
    ],
    "summary": {
        "total_hours": "decimal",
        "billable_hours": "decimal",
        "non_billable_hours": "decimal",
        "billable_percentage": "decimal"
    }
}
```

#### 15.1.2 Time Detail Report
```http
GET /api/v1/reports/time/details
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - user_ids: array of integers (optional)
  - project_ids: array of integers (optional)
  - client_ids: array of integers (optional)
  - include_non_billable: boolean (optional, default: true)
  - page: integer (default: 1)
  - limit: integer (default: 50)
```

#### Response
```json
{
    "data": [
        {
            "time_entry_id": "integer",
            "date": "date",
            "user": {
                "id": "integer",
                "name": "string"
            },
            "project": {
                "id": "integer",
                "name": "string"
            },
            "task": {
                "id": "integer",
                "name": "string"
            },
            "hours": "decimal",
            "is_billable": "boolean",
            "notes": "string"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    },
    "summary": {
        "total_hours": "decimal",
        "billable_hours": "decimal",
        "non_billable_hours": "decimal"
    }
}
```

#### 15.1.3 User Utilization Report
```http
GET /api/v1/reports/time/utilization
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - user_ids: array of integers (optional)
  - department: string (optional)
  - role_id: integer (optional)
  - target_utilization: decimal (optional, default: based on role settings)
```

#### Response
```json
{
    "data": [
        {
            "user": {
                "id": "integer",
                "name": "string",
                "department": "string",
                "role": "string"
            },
            "standard_hours": "decimal",
            "actual_hours": "decimal",
            "billable_hours": "decimal",
            "utilization_rate": "decimal", // percentage of standard hours
            "billable_utilization": "decimal", // percentage of billable hours to standard
            "target_utilization": "decimal",
            "variance": "decimal" // difference from target
        }
    ],
    "summary": {
        "total_users": "integer",
        "average_utilization": "decimal",
        "average_billable_utilization": "decimal",
        "below_target_count": "integer"
    }
}
```

#### 15.1.4 Client Hours Report
```http
GET /api/v1/reports/time/client-hours
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - client_ids: array of integers (optional)
  - include_details: boolean (optional, default: false)
```

#### Response
```json
{
    "data": [
        {
            "client": {
                "id": "integer",
                "name": "string"
            },
            "total_hours": "decimal",
            "billable_hours": "decimal",
            "non_billable_hours": "decimal",
            "project_count": "integer",
            "projects": [ // Only included when include_details is true
                {
                    "id": "integer",
                    "name": "string",
                    "total_hours": "decimal",
                    "billable_hours": "decimal"
                }
            ]
        }
    ],
    "summary": {
        "total_clients": "integer",
        "total_hours": "decimal",
        "billable_hours": "decimal",
        "average_hours_per_client": "decimal"
    }
}
```

### 15.2 Plan/Variance Reports

#### 15.2.1 Project Plan vs Actual Report
```http
GET /api/v1/reports/plan-variance/project
Authorization: Bearer {token}
Query Parameters:
  - project_ids: array of integers (required)
  - include_tasks: boolean (optional, default: false)
  - as_of_date: date (optional, default: current date)
```

#### Response
```json
{
    "data": [
        {
            "project": {
            "id": "integer",
                "name": "string",
                "status": "string"
            },
            "planned_hours": "decimal",
            "actual_hours": "decimal",
            "variance_hours": "decimal",
            "variance_percentage": "decimal",
            "estimated_completion": "date",
            "planned_completion": "date",
            "schedule_variance_days": "integer",
            "tasks": [ // Only included when include_tasks is true
                {
                    "id": "integer",
                    "name": "string",
                    "planned_hours": "decimal",
                    "actual_hours": "decimal",
                    "variance_hours": "decimal",
                    "variance_percentage": "decimal",
                    "status": "string"
                }
            ]
        }
    ],
    "summary": {
        "total_projects": "integer",
        "on_track_count": "integer",
        "over_budget_count": "integer",
        "under_budget_count": "integer",
        "average_variance_percentage": "decimal"
    }
}
```

#### 15.2.2 Resource Allocation Report
```http
GET /api/v1/reports/plan-variance/resource-allocation
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - user_ids: array of integers (optional)
  - department: string (optional)
  - show_details: boolean (optional, default: false)
```

#### Response
```json
{
    "data": [
        {
            "user": {
                "id": "integer",
                "name": "string",
                "department": "string",
                "role": "string"
            },
            "capacity_hours": "decimal",
            "allocated_hours": "decimal",
            "actual_hours": "decimal",
            "allocation_percentage": "decimal",
            "over_allocation_hours": "decimal",
            "available_hours": "decimal",
            "projects": [ // Only included when show_details is true
                {
                    "id": "integer",
                    "name": "string",
                    "allocated_hours": "decimal",
                    "actual_hours": "decimal"
                }
            ]
        }
    ],
    "summary": {
        "total_users": "integer",
        "average_allocation": "decimal",
        "over_allocated_count": "integer",
        "under_allocated_count": "integer"
    }
}
```

#### 15.2.3 Budget Burndown Report
```http
GET /api/v1/reports/plan-variance/budget-burndown
Authorization: Bearer {token}
Query Parameters:
  - project_id: integer (required)
  - start_date: date (optional)
  - end_date: date (optional)
  - interval: string (optional, values: "day", "week", "month", default: "week")
```

#### Response
```json
{
    "project": {
        "id": "integer",
        "name": "string",
        "budget_hours": "decimal"
    },
    "current_burn_rate": "decimal", // hours per day
    "projected_completion": "date",
    "projected_total_hours": "decimal",
    "projected_variance": "decimal",
    "data_points": [
        {
            "date": "date",
            "planned_hours": "decimal",
            "actual_hours": "decimal",
            "planned_cumulative": "decimal",
            "actual_cumulative": "decimal",
            "burn_rate": "decimal"
        }
    ],
    "status": {
        "burn_rate_status": "string", // "high", "normal", "low"
        "projected_outcome": "string" // "over_budget", "on_budget", "under_budget"
    }
}
```

### 15.3 Performance Reports

#### 15.3.1 Team Performance Report
```http
GET /api/v1/reports/performance/team
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - department: string (optional)
  - role_id: integer (optional)
  - metrics: array of strings (optional, values: "utilization", "billable_ratio", "task_completion", "timesheet_compliance")
```

#### Response
```json
{
    "data": [
        {
            "department": "string",
            "headcount": "integer",
            "metrics": {
                "utilization": "decimal",
                "billable_ratio": "decimal",
                "task_completion_rate": "decimal",
                "timesheet_compliance": "decimal"
            },
            "trending": {
                "utilization": "string", // "up", "down", "stable"
                "billable_ratio": "string",
                "task_completion_rate": "string",
                "timesheet_compliance": "string"
            }
        }
    ],
    "organization_summary": {
        "total_departments": "integer",
        "total_headcount": "integer",
        "average_metrics": {
            "utilization": "decimal",
            "billable_ratio": "decimal",
            "task_completion_rate": "decimal",
            "timesheet_compliance": "decimal"
        }
    }
}
```

#### 15.3.2 Project Performance Metrics
```http
GET /api/v1/reports/performance/projects
Authorization: Bearer {token}
Query Parameters:
  - start_date: date (optional)
  - end_date: date (optional)
  - client_id: integer (optional)
  - status: string (optional, values: "active", "completed", "all", default: "active")
  - sort_by: string (optional, values: "efficiency", "cost_variance", "schedule_variance", default: "efficiency")
  - limit: integer (optional, default: 10)
```

#### Response
```json
{
    "data": [
        {
            "project": {
            "id": "integer",
                "name": "string",
                "client": "string",
                "status": "string"
            },
            "metrics": {
                "efficiency_score": "decimal", // 0-100
                "cost_variance_percentage": "decimal",
                "schedule_variance_percentage": "decimal",
                "quality_score": "decimal", // 0-100
                "client_satisfaction": "decimal" // 0-5
            },
            "performance_indicators": {
                "efficiency": "string", // "excellent", "good", "average", "poor"
                "cost": "string", // "under_budget", "on_budget", "over_budget"
                "schedule": "string", // "ahead", "on_track", "behind"
                "quality": "string" // "high", "medium", "low"
            }
        }
    ],
    "total_projects": "integer",
    "average_metrics": {
        "efficiency_score": "decimal",
        "cost_variance_percentage": "decimal",
        "schedule_variance_percentage": "decimal",
        "quality_score": "decimal",
        "client_satisfaction": "decimal"
    }
}
```

#### 15.3.3 Cost Analysis Report
```http
GET /api/v1/reports/performance/cost-analysis
Authorization: Bearer {token}
Required Permission: view_cost_data
Query Parameters:
  - start_date: date (required)
  - end_date: date (required)
  - project_ids: array of integers (optional)
  - client_ids: array of integers (optional)
  - group_by: string (optional, values: "project", "client", "role", "department", default: "project")
```

#### Response
```json
{
    "data": [
        {
            "group_name": "string", // Project name, client name, etc.
            "group_id": "integer",
            "total_cost": "decimal",
            "labor_cost": "decimal",
            "expense_cost": "decimal",
            "revenue": "decimal",
            "profit": "decimal",
            "margin_percentage": "decimal",
            "cost_breakdown": {
                "role_costs": [
                    {
                        "role": "string",
                        "hours": "decimal",
                        "cost": "decimal",
                        "percentage": "decimal"
                    }
                ]
            }
        }
    ],
    "summary": {
        "total_cost": "decimal",
        "total_revenue": "decimal",
        "total_profit": "decimal",
        "average_margin": "decimal"
    }
}
```

### 15.4 Report Management

#### 15.4.1 List Saved Reports
```http
GET /api/v1/saved-reports
Authorization: Bearer {token}
Query Parameters:
  - report_type: string (optional)
  - page: integer (default: 1)
  - limit: integer (default: 10)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "report_type": "string",
            "description": "string",
            "parameters": "object", // Report-specific parameters
            "is_favorite": "boolean",
            "is_public": "boolean",
            "last_run_at": "datetime",
            "created_by": {
                "id": "integer",
                "name": "string"
            },
            "created_at": "datetime"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

#### 15.4.2 Save Report Configuration
```http
POST /api/v1/saved-reports
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "report_type": "string",
    "description": "string",
    "parameters": "object", // Report-specific parameters
    "is_public": "boolean", // Optional, default: false
    "schedule": { // Optional
        "frequency": "string", // "daily", "weekly", "monthly"
        "day_of_week": "integer", // 0-6, only for weekly
        "day_of_month": "integer", // 1-31, only for monthly
        "time": "string", // HH:MM format
        "recipients": ["string"] // Array of email addresses
    }
}
```

#### 15.4.3 Run Saved Report
```http
POST /api/v1/saved-reports/{id}/run
Authorization: Bearer {token}
Content-Type: application/json

{
    "format": "string", // "json", "pdf", "excel", "csv"
    "override_parameters": "object" // Optional, override saved parameters
}
```

#### Response
```json
{
    "report_id": "string",
    "status": "string", // "processing", "completed", "failed"
    "result_url": "string", // URL to download the report when completed
    "expires_at": "datetime" // when the report will expire
}
```

#### 15.4.4 Get Report Status
```http
GET /api/v1/reports/status/{report_id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "report_id": "string",
    "status": "string", // "processing", "completed", "failed"
    "progress": "integer", // percentage complete (0-100)
    "result_url": "string", // URL to download the report when completed
    "expires_at": "datetime", // when the report will expire
    "error": "string" // only present if status is "failed"
}
```

#### 15.4.5 Delete Saved Report
```http
DELETE /api/v1/saved-reports/{id}
Authorization: Bearer {token}
```

#### 15.4.6 Update Saved Report
```http
PUT /api/v1/saved-reports/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "description": "string",
    "parameters": "object",
    "is_public": "boolean",
    "schedule": {
        "frequency": "string",
        "day_of_week": "integer",
        "day_of_month": "integer",
        "time": "string",
        "recipients": ["string"]
    }
}
```

#### 15.4.7 Clone Saved Report
```http
POST /api/v1/saved-reports/{id}/clone
Authorization: Bearer {token}
Content-Type: application/json

{
    "new_name": "string", // Optional, default: "Copy of {original name}"
    "description": "string" // Optional
}
```

#### Response
```json
{
    "id": "integer",
    "name": "string",
    "report_type": "string",
    "description": "string",
    "parameters": "object",
    "is_public": "boolean",
    "created_at": "datetime"
}
```

#### 15.4.8 Get Report Dashboard Data
```http
GET /api/v1/reports/dashboard
Authorization: Bearer {token}
Query Parameters:
  - period: string (optional, values: "week", "month", "quarter", "year", default: "month")
  - date: date (optional, default: current date)
```

#### Response
```json
{
    "period": {
        "label": "string",
        "start_date": "date",
        "end_date": "date"
    },
    "key_metrics": {
        "total_hours_logged": "decimal",
        "billable_percentage": "decimal",
        "overall_utilization": "decimal",
        "average_project_margin": "decimal",
        "timesheet_compliance": "decimal"
    },
    "charts": {
        "hours_by_client": [
            {
                "name": "string",
                "value": "decimal",
                "percentage": "decimal"
            }
        ],
        "utilization_trend": [
            {
                "date": "string",
                "utilization": "decimal"
            }
        ],
        "billable_vs_non_billable": {
            "billable": "decimal",
            "non_billable": "decimal"
        },
        "project_status_distribution": [
            {
                "status": "string",
                "count": "integer",
                "percentage": "decimal"
            }
        ]
    },
    "recent_reports": [
        {
            "id": "integer",
            "name": "string",
            "report_type": "string",
            "run_at": "datetime"
        }
    ]
}
```

## 16. Tag Management

### 16.1 List Tags
```http
GET /api/v1/tags
Authorization: Bearer {token}
Query Parameters:
  - page: integer (default: 1)
  - limit: integer (default: 10)
  - search: string (optional)
```

#### Response
```json
{
    "data": [
        {
            "id": "integer",
            "name": "string",
            "color": "string",
            "description": "string"
        }
    ],
    "pagination": {
        "total": "integer",
        "page": "integer",
        "limit": "integer",
        "pages": "integer"
    }
}
```

### 16.2 Create Tag
```http
POST /api/v1/tags
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "color": "string",
    "description": "string"
}
```

### 16.3 Update Tag
```http
PUT /api/v1/tags/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "string",
    "color": "string",
    "description": "string"
}
```

### 16.4 Delete Tag
```http
DELETE /api/v1/tags/{id}
Authorization: Bearer {token}
```

### 16.5 Get Tag Details
```http
GET /api/v1/tags/{id}
Authorization: Bearer {token}
```

#### Response
```json
{
    "id": "integer",
    "name": "string",
    "color": "string",
    "description": "string",
    "created_at": "datetime",
    "modified_at": "datetime"
}
```

## Multi-Tenancy

### Headers
All API requests must include the tenant context, which is automatically handled by the middleware:
```http
X-Tenant: tenant1
```

### Tenant Management Endpoints (Central)

#### Get Current Tenant
```http
GET /api/tenant
Authorization: Bearer {token}
```

Response:
```json
{
    "id": 1,
    "name": "Tenant 1",
    "subdomain": "tenant1",
    "status": "active",
    "created_at": "2024-03-20T10:00:00Z"
}
```

#### Get Tenant Settings
```http
GET /api/tenant/settings
Authorization: Bearer {token}
```

Response:
```json
{
    "settings": {
        "theme": "light",
        "timezone": "UTC",
        "date_format": "Y-m-d"
    }
}
```

### Error Responses

#### Tenant Not Found
```json
{
    "error": "Tenant not found",
    "status": 404
}
```

#### Invalid Tenant
```json
{
    "error": "Invalid tenant or inactive subscription",
    "status": 403
} 