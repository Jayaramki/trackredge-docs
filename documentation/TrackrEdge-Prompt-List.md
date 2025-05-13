# TrackrEdge Step-by-Step Prompt List

## Visual Workflow Diagram
```mermaid
flowchart TD
    A[Start: Open Prompt List] --> B[Docker & Containerization]
    B --> C[Project Generation (Angular/Laravel)]
    C --> D[Development & Feature Implementation]
    D --> E[Log Changes in prompt-log.json]
    E --> F[Update Documentation]
    F --> G[Repeat for Next Feature/Step]
```
- **Always start with the prompt list for any workflow.**
- **Follow the order in the diagram for every new feature, fix, or setup.**
- **Log every change in prompt-log.json for traceability.**

## IMPORTANT: Development Sequencing
- This prompt list is sequenced to match the prioritized development plan in `TrackrEdge-Development-Plan.md`
- Follow the phases in order to ensure proper feature dependencies are met
- Always use Docker for all commands (NEVER use host machine PHP, Node, or Angular CLI)
- Each prompt should be run with Cursor AI IDE + Claude 3.7
- Log all changes in prompt-log.json after each step

## IMPORTANT: Always Use Docker
- **All commands, builds, and development steps must use Docker Compose or `docker exec` inside containers.**
- **Never use host machine PHP, Node, or Angular CLI.**
- **trackredge-portal (Angular) and trackredge-api (Laravel) are maintained as separate repositories.**
- **All prompts below assume Dockerized workflow.**

## IMPORTANT: Updating prompt-log.json
- Read the sample JSON structure from the sample-prompt-log.json file.
- Create a new prompt-log.json file using the same structure.
- Log each prompt interaction in the prompt-log.json file.
- Always use the following command to generate the current timestamp: `Get-Date -Format "yyyy-MM-dd hh:mm:sstt zzz"`
- Accurately record the time taken to complete each prompt.

---

## Phase 1: Project Setup & Infrastructure

### 1. Project Baseline Setup

#### 1.1 Initialize Angular Frontend
```
Set up a new Angular project (Angular 19.2) for TrackrEdge by running following command
- Use docker run  to create Angular project
    - `docker run --rm -v ${PWD}:/app -w /app node:24 bash -c "npx -y @angular/cli@19.2 new trackredge-portal --style=scss --routing=true"`
- Initialize git and add node_modules folder
- Reference: UI Specifications (overall layout)
- Log this prompt in prompt-log.json
```

#### 1.2 Initialize Laravel Backend
```
Set up a new Laravel API project (Laravel 12) for TrackrEdge named "trackredge-api".
- Use Composer to create the Laravel project
    - `docker run --rm -v ${PWD}:/app -w /app composer:latest composer create-project laravel/laravel trackredge-api --prefer-dist`
- Make sure the initial directory structure (app, routes, config, database, etc.)
- Initialize git and add gitignore file to skip vendor, etc.
- Reference: API Documentation (auth endpoints)
- Log this prompt in prompt-log.json
```

#### 1.3 Create Dockerfile for Angular Project
```
Create a Dockerfile for the Angular project (trackredge-portal) to be used with Docker Compose.
- Place the Dockerfile in the root of the Angular repo (must be cloned first).
- Reference: docker-compose.yml (frontend service)
- Log this prompt in prompt-log.json
```

#### 1.4 Create Dockerfile for Laravel Project
```
Create a Dockerfile for the Laravel API project (trackredge-api) to be used with Docker Compose.
- Place the Dockerfile in the root of the Laravel repo (must be cloned first).
- Reference: docker-compose.yml (backend service)
- Log this prompt in prompt-log.json
```

#### 1.5 Add pgAdmin and Mailhog Services
```
Add pgAdmin and Mailhog services to docker-compose.yml for DB and email testing.
- Reference: docker-compose.yml
- Log this prompt in prompt-log.json
```

#### 1.6 Build and Start All Services (Docker)
```
Build and start all services using Docker Compose (no host PHP/ng/node):
- Command: docker compose up --build
- Log this prompt in prompt-log.json
```

#### 1.7 Run All Containers
```
Start all services using Docker Compose.
- Command: docker compose up --build
- Log this prompt in prompt-log.json
```

#### 1.8 Connect Services
```
Verify Laravel connects to PostgreSQL and Mailhog, and Angular connects to API.
- Reference: docker-compose.yml, .env files
- Log this prompt in prompt-log.json
```

#### 1.9 Troubleshoot Docker Issues
```
Troubleshoot Docker Compose issues (container not starting, port conflict, etc.).
- Reference: docker-compose.yml, logs
- Log this prompt in prompt-log.json
```

#### 1.10 Update Documentation for Docker
```
Update all documentation files to include Docker setup and usage instructions.
- Reference: Product Specification, README, docker-compose.yml
- Log this prompt in prompt-log.json
```

### 2. Project Setup

#### 2.1 Local Development Setup

##### 2.1.1 Configure Local Domains
```
Set up local domain configuration for multi-tenant testing:
- Edit Windows hosts file (C:\Windows\System32\drivers\etc\hosts)
- Add entries for trackredge.local and tenant subdomains
- Reference: Product Specification (multi-tenancy requirements)
- Log this prompt in prompt-log.json
```

##### 2.1.2 Configure Laravel Environment
```
Update Laravel environment for multi-tenant support:
- Update .env with domain settings
- Configure session and cookie domains
- Set up database connections
- Reference: Product Specification (multi-tenancy requirements)
- Log this prompt in prompt-log.json
```

#### 2.2 Install and Configure Stancl/tenancy

##### 2.2.1 Install Package
```
Install Stancl/tenancy package in Laravel:
- Command: docker compose exec backend composer require stancl/tenancy
- Command: docker compose exec backend php artisan tenancy:install
- Reference: Product Specification (multi-tenancy requirements)
- Log this prompt in prompt-log.json
```

##### 2.2.2 Configure Central Database
```
Set up central database for tenant management:
- Create trackredge_central database
- Run central migrations
- Configure database connections
- Reference: Database Design (tenant tables)
- Log this prompt in prompt-log.json
```

###### 2.2.3 Configure Tenant Model
```
Set up Tenant model and related configurations:
- Create/update Tenant model
- Configure domains and database handling
- Set up tenant middleware
- Reference: Product Specification (multi-tenancy requirements)
- Log this prompt in prompt-log.json
```

#### 2.3 Angular Multi-Tenant Setup

##### 2.3.1 Configure Environment
```
Update Angular environment configuration for multi-tenant support:
- Add tenant detection logic
- Configure API URL handling
- Set up tenant context
- Reference: UI Specifications
- Log this prompt in prompt-log.json
```

##### 2.3.2 Create Tenant Service
```
Create Angular service for tenant management:
- Implement tenant detection
- Handle tenant-specific routing
- Configure API interceptors
- Reference: UI Specifications
- Log this prompt in prompt-log.json
```

##### 2.4 Testing Multi-Tenancy

###### 2.4.1 Create Test Tenant
```
Create and configure test tenant:
- Create tenant record
- Set up tenant database
- Configure domain
- Test tenant access
- Reference: Product Specification (multi-tenancy requirements)
- Log this prompt in prompt-log.json
```

###### 2.4.2 Test Tenant Isolation
```
Verify tenant data isolation:
- Test database separation
- Verify API scoping
- Check domain routing
- Test tenant switching
- Reference: Product Specification (multi-tenancy requirements)
- Log this prompt in prompt-log.json
```

#### 2.4 Git Repository & CI/CD
```
Initialize a Git repository and set up basic CI/CD for both Angular and Laravel projects.
- Add .gitignore, README, and initial commit
- Set up GitHub Actions or GitLab CI for build/test
- Reference: Product Specification (technical requirements)
- Log this prompt in prompt-log.json
```

#### 2.5 Basic PWA Setup
```
Implement basic Progressive Web App capabilities.
- Create app manifest and service workers
- Configure for installability on mobile devices and desktops
- Set up basic caching for core app assets
- Implement responsive layouts for mobile and desktop view
- Apply glassmorphism appropriately for installable interfaces
- Test installation flow on various devices (including desktop)
- Reference: Product Specification (Progressive Web App Capabilities), UI Specifications (Mobile & PWA Experience)
- Log this prompt in prompt-log.json
```

### 3. Repository & Project Setup

#### 3.1 Run Angular Commands in Docker
```
Run Angular CLI commands inside the frontend container:
- Command: docker compose exec frontend npx ng <command>
- Example: docker compose exec frontend npx ng build
- Log this prompt in prompt-log.json
```

#### 3.2 Run Laravel Commands in Docker
```
Run Laravel Artisan or Composer commands inside the backend container:
- Command: docker compose exec backend php artisan <command>
- Example: docker compose exec backend php artisan migrate
- Log this prompt in prompt-log.json
```

### 4. Directory & Module Structure

#### 4.1 Angular App Structure
```
Define and create the recommended Angular app directory and module structure for TrackrEdge.
- Feature modules (auth, dashboard, projects, tasks, reports, etc.)
- Shared and core modules
- Reference: UI Specifications (navigation, layout)
- Log this prompt in prompt-log.json
```

#### 4.2 Laravel App Structure
```
Define and create the recommended Laravel app directory and module structure for TrackrEdge.
- Modules for Auth, Projects, Tasks, Time, Clients, Products, Reports
- Service, Repository, Controller, Model layers
- Reference: API Documentation (endpoints)
- Log this prompt in prompt-log.json
```

---

## Phase 2: Core UI & Authentication

### 5. UI Foundation 

#### 5.1 UI Layout Skeleton
```
Generate the base UI layout for TrackrEdge in Angular with glassmorphism design.
- App shell, main layout, router-outlet
- Apply frosted glass effects and multi-layered interface
- Reference: UI Specifications (layout, theme, glassmorphism)
- Log this prompt in prompt-log.json
```

#### 5.2 Sidebar Menu
```
Create the sidebar navigation menu in Angular with glassmorphism styling.
- Menu items: Dashboard, Projects, Tasks, Time, Reports, Admin
- Collapsible/expandable sections
- Apply frosted glass effect with subtle borders
- Reference: UI Specifications (sidebar, glassmorphism)
- Log this prompt in prompt-log.json
```

#### 5.3 Header & Top Bar
```
Create the header/top bar for TrackrEdge with glassmorphism styling.
- Includes logo, user profile, notifications, settings
- Apply translucent glass effect with light borders
- Reference: UI Specifications (header, glassmorphism)
- Log this prompt in prompt-log.json
```

### 6. UI/UX Foundations

#### 6.1 Theme & Styling
```
Implement the TrackrEdge theme, color palette, and typography in Angular with glassmorphism.
- Set up base glassmorphism styling framework
- Create reusable glass-effect components
- Reference: UI Specifications (Theme & Styling, Glassmorphism Style)
- Log this prompt in prompt-log.json
```

#### 6.2 Responsive Design
```
Implement responsive layouts for all screens (desktop, tablet, mobile).
- Ensure glassmorphism components adapt to different screen sizes
- Create fluid layouts with appropriate spacing
- Reference: UI Specifications (Responsive Design)
- Log this prompt in prompt-log.json
```

#### 6.3 Accessibility
```
Ensure accessibility (a11y) best practices across the UI.
- Test glassmorphism components for accessibility
- Ensure proper contrast and focus states
- Reference: UI Specifications (Component Library, Interaction Patterns)
- Log this prompt in prompt-log.json
```

#### 6.4 Design Modern & Innovative Admin Panel
```
Design a modern, innovative admin panel layout (not a generic dashboard).
- Research UI/UX inspiration from Dribbble, Behance, and top SaaS dashboards.
- Focus on custom layouts, micro-interactions, and beautiful data visualizations.
- Apply glassmorphism consistently across all admin components
- Reference: UI Specifications (Modern & Innovative Admin Panel Requirement)
- Log this prompt in prompt-log.json
```

#### 6.5 Implement Custom Components & Animations
```
Implement custom UI components, transitions, and micro-animations for a delightful user experience.
- Create glassmorphism-specific animations and transitions
- Add subtle hover effects for interactive elements
- Reference: UI Specifications (Component Library, Interaction Patterns)
- Log this prompt in prompt-log.json
```

#### 6.6 Review UI for Wow Factor
```
Review the UI for modernity, innovation, and wow factor. Suggest improvements to avoid a boring admin look.
- Ensure glassmorphism is applied consistently
- Check for visual impact and user delight
- Reference: UI Specifications (Modern & Innovative Admin Panel Requirement)
- Log this prompt in prompt-log.json
```

#### 6.7 Use Glassmorphism Style
```
Apply glassmorphism style to cards, panels, and modals for a frosted-glass, modern look.
- Combine Bootstrap grid for layout and Angular Material for UI components.
- Reference: UI Specifications (Glassmorphism Style)
- Log this prompt in prompt-log.json
```

#### 6.8 Review UI for Glassmorphism and Modernity
```
Review the UI to ensure glassmorphism and modern design patterns are applied consistently.
- Check all components for proper glass effects
- Ensure consistent use of transparency, blur, and borders
- Reference: UI Specifications (Glassmorphism Style, Modern & Innovative Admin Panel Requirement)
- Log this prompt in prompt-log.json
```

#### 6.9 Implement Ag-Grid for Data Visualization
```
Implement Ag-Grid as the standard data grid component for all listing screens.
- Customize Ag-Grid to match glassmorphism design
- Apply custom styling for rows, headers, and interactive elements
- Implement advanced features (filtering, sorting, export)
- Create custom cell renderers for visual data presentation
- Set up base grid configurations for reuse across the app
- Implement responsive behavior for different devices
- Reference: UI Specifications (Data Grid Component - Ag-Grid), Product Specification (Ag-Grid for Data Display)
- Log this prompt in prompt-log.json
```

#### 6.10 Error Handling and User Feedback System
```
Implement a consistent error handling and user feedback system.
- Create standardized error component with glassmorphism styling
- Implement toast notifications for user feedback
- Add validation feedback for all form inputs
- Implement error recovery suggestions where applicable
- Reference: UI Specifications
- Log this prompt in prompt-log.json
```

### 7. Authentication & User Management

#### 7.1 Auth API Endpoints (Laravel)
```
Implement authentication endpoints in Laravel (login, logout, refresh, password reset).
- Reference: API Documentation (auth endpoints)
- Log this prompt in prompt-log.json
```

#### 7.2 Auth UI (Angular)
```
Use docker for local environment setup
Create login, registration, and password reset screens in Angular with glassmorphism.
- Apply frosted glass effects to form containers
- Add subtle animations for input focus
- Reference: UI Specifications (login, password reset, glassmorphism)
- Log this prompt in prompt-log.json
```

#### 7.3 User Management Module
```
Implement user management (list, create, edit, deactivate users) in both API and UI.
- Create user listing with Ag-Grid
- Apply glassmorphism styling to user details and forms
- Reference: Product Specification (User Management), API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 7.4 Role-Based Cost Tracking
```
Implement role-based cost tracking system with hourly and daily rates tied to roles.
- Add cost fields to roles table and update UI
- Implement historical rate tracking
- Add cost calculation for time entries based on user role
- Create cost reports and dashboards (only for authorized roles)
- Apply glassmorphism to cost management screens
- Reference: Product Specification (Role-Based Cost Tracking), Database Design (roles table, role_cost_history table), API Documentation (role cost endpoints), UI Specifications (role cost screens)
- Log this prompt in prompt-log.json
```

#### 7.5 User-Specific Cost Rates
```
Implement user-specific cost rates with fallback to role-based rates.
- Add cost fields to users table and UI forms
- Create history tracking for user rate changes
- Modify time entry cost calculations to prioritize user rates
- Enhance reporting to show rate differences
- Apply glassmorphism to user cost management screens
- Reference: Product Specification (User-Level Cost Settings), Database Design (users table, user_cost_history table), API Documentation (user cost endpoints), UI Specifications (user cost screens)
- Log this prompt in prompt-log.json
```

#### 7.6 Cost Visibility Restrictions
```
Implement cost visibility restrictions based on user roles and permissions.
- Add special permissions for cost data access
- Create segregated cost dashboards
- Implement UI conditional rendering for cost-related elements
- Add audit logging for cost data access
- Apply glassmorphism to role-specific dashboards
- Reference: Product Specification (Cost Data Visibility Control), Database Design (role_permissions table), API Documentation (cost visibility endpoints), UI Specifications (cost screens)
- Log this prompt in prompt-log.json
```

#### 7.7 System-wide Audit Logging
```
Implement comprehensive audit logging system throughout the application.
- Add audit trails for all significant actions (CRUD operations, status changes, etc.)
- Create admin interface for viewing and filtering audit logs
- Implement retention policy for audit records
- Ensure proper indexing for performance
- Add export capabilities for compliance purposes
- Reference: Product Specification (Security Requirements - Audit Logging), API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

### 8. Advanced Features & Admin

#### 8.1 Role & Permission Management
```
Implement role and permission management in both API and UI.
- Create roles listing with Ag-Grid
- Apply glassmorphism styling to permission management
- Set up role-based access control throughout the application
- Reference: Product Specification (Role Management), API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 8.2 Notification System
```
Implement notification system (in-app, email) in both API and UI.
- Create in-app notification center with glassmorphism
- Implement real-time notification alerts
- Design glassmorphism notification components
- Reference: Product Specification (Notifications), API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

---

## Phase 3: Essential Modules

### 9. Core Modules ( Products, Clients, Projects, Phases, Tasks, Timesheets, )

#### 9.1 Product Management
```
Implement product management (CRUD, list, details, status) in both API and UI.
- Create product listing with Ag-Grid
- Develop product details with glassmorphism panels
- Set up product status tracking
- Reference: Product Specification (Product Management), Database Design, API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 9.2 Client Management
```
Implement client management (CRUD, mapping to projects) in both API and UI.
- Create client listing with Ag-Grid
- Develop client details with glassmorphism panels
- Set up client-project associations
- Reference: Product Specification (Client Management), Database Design, API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 9.3 Project Management
```
Implement project management (CRUD, list, details, status) in both API and UI.
- Create project listing with Ag-Grid
- Develop project details with glassmorphism panels
- Set up project status tracking
- Reference: Product Specification (Project Management), Database Design, API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 9.4 Phase Management
```
Implement project phase management (CRUD, assign tasks, reporting) in both API and UI.
- Create phase management screens with glassmorphism
- Implement phase visualization with frosted glass panels
- Set up task-to-phase assignment interface
- Reference: Product Specification (Project Phases), Database Design (project_phases table, phase_id in tasks), API Documentation (phase endpoints), UI Specifications (phase screens)
- Log this prompt in prompt-log.json
```

#### 9.5 Task Management
```
Implement task management (CRUD, parent-child, types) in both API and UI.
- Create task listing with Ag-Grid
- Develop task details with glassmorphism panels
- Set up task status tracking
- Reference: Product Specification (Task Management), Database Design, API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 9.5.1 Tag Management Database
```
Implement tag management database structure.
- Create tags table with name, color, and description fields
- Create task_tags junction table for many-to-many relationship
- Set up proper indexes and foreign key constraints
- Reference: Database Design (tags and task_tags tables)
- Log this prompt in prompt-log.json
```

#### 9.5.2 Tag Management API
```
Implement tag management API endpoints.
- Create tag CRUD operations
- Implement task-tag association endpoints
- Add tag filtering and search capabilities
- Set up tag usage statistics endpoints
- Reference: API Documentation (Tag Management)
- Log this prompt in prompt-log.json
```

#### 9.5.3 Tag Management UI Components
```
Create tag management UI components with glassmorphism styling.
- Implement tag list view with color previews
- Create tag creation/edit form with color picker
- Add tag usage statistics display
- Apply glassmorphism styling to all tag components
- Reference: UI Specifications (Tag Management)
- Log this prompt in prompt-log.json
```

#### 9.5.4 Task-Tag Integration UI
```
Implement task-tag integration in the task management interface.
- Add multi-select tag field to task forms
- Create tag chips display in task lists
- Implement tag-based filtering in task views
- Apply glassmorphism styling to tag selection components
- Reference: UI Specifications (Task Details, Tag Selection)
- Log this prompt in prompt-log.json
```

#### 9.5.5 Tag Management Features
```
Implement advanced tag management features.
- Add tag color management system
- Create tag usage analytics
- Implement bulk tag operations
- Add tag search and filtering capabilities
- Reference: Product Specification (Tag Management)
- Log this prompt in prompt-log.json
```

#### 9.6 Timesheet Management
```
Implement timesheet management features in both API and UI.
- Create weekly timesheet view with Ag-Grid
- Implement timesheet approval workflow
- Apply glassmorphism styling to timesheet components
- Set up timesheet status tracking
- Reference: Product Specification (Timesheet Management), Database Design, API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 9.7 Time Reports
```
Implement time reporting features in both API and UI.
- Create time summary and detail reports with Ag-Grid
- Add client hours and utilization reports
- Implement advanced filtering and data grouping
- Add export capabilities for time data
- Apply glassmorphism styling to report components
- Reference: Product Specification (Time Reports), Database Design, API Documentation (Time-Related Reports), UI Specifications
- Log this prompt in prompt-log.json
```

#### 9.8 Quick Log Widget
```
Implement Quick Log Widget for rapid time entry from dashboard.
- Create dashboard-based widget UI component with glassmorphism
- Add recent projects/tasks selection
- Implement preset duration buttons
- Add Today/Yesterday toggle
- Allow submission without leaving dashboard
- Reference: Product Specification (Quick Log Widget), API Documentation (quick log endpoints), UI Specifications (Quick Log Widget)
- Log this prompt in prompt-log.json
```

#### 9.9 Timesheet Templates
```
Implement Timesheet Templates for saving and applying common weekly patterns.
- Create templates CRUD functionality
- Implement template application to timesheets
- Add standard, project-focused, and custom user-defined templates
- Enable team templates shared by managers
- Integrate with Ag-Grid for template preview
- Reference: Product Specification (Timesheet Templates), Database Design (timesheet_templates, template_entries tables), API Documentation (template endpoints), UI Specifications (timesheet template screens)
- Log this prompt in prompt-log.json
```

#### 9.10 Bulk/Batch Operations
```
Implement bulk/batch operations (API, DB, UI).
- Create bulk time entry interface
- Implement mass update functionality for projects/tasks
- Integrate with Ag-Grid for selection and operations
- Apply glassmorphism to bulk operation interfaces
- Reference: Product Specification (Bulk/Batch Operations), Database Design (bulk_ops), API Documentation (bulk endpoints), UI Specifications (bulk operation screens)
- Log this prompt in prompt-log.json
```

#### 9.11 Project Cloning Feature
```
Implement project cloning functionality in both API and UI.
- Create clone interface with options for phases, tasks, and team members
- Implement date adjustment for the cloned project
- Ensure all relationships are properly copied
- Handle potential naming conflicts
- Reference: Product Specification (Project Management), API Documentation (2.4 Clone Project), UI Specifications
- Log this prompt in prompt-log.json
```

---

## Phase 4: Time Management & Cost Tracking

### 10. Reporting & Analytics

#### 10.1 Project Status Reports
```
Implement project status reporting in both API and UI.
- Create status report screens with glassmorphism
- Implement Ag-Grid for tabular reports
- Add visually appealing charts with glass effects
- Implement Plan vs Actual comparison views
- Add budget burndown visualization
- Reference: Product Specification (Reporting & Analytics), Database Design, API Documentation (Plan/Variance Reports), UI Specifications
- Log this prompt in prompt-log.json
```

#### 10.2 Resource Utilization Reports
```
Implement resource utilization reporting in both API and UI.
- Create resource reports with glassmorphism styling
- Add team performance metrics dashboard
- Implement resource allocation comparison
- Create utilization trend analysis
- Apply glassmorphism to report components
- Reference: Product Specification (Reporting & Analytics), Database Design, API Documentation (Time Reports, Performance Reports), UI Specifications
- Log this prompt in prompt-log.json
```

#### 10.3 Financial Reporting Features
```
Implement comprehensive financial reporting capabilities.
- P&L Trend Analysis with historical visualization
- Profitability Monitoring with customizable thresholds
- Earned Value Management metrics (SPI, CPI, EV)
- Financial KPI Dashboard
- Cost Analysis by client, project, role, and department
- Accounting System Integration for exports
- Apply glassmorphism to all financial visualizations
- Reference: Product Specification (Financial Performance Reports), API Documentation (Performance Reports, Financial Reports), UI Specifications (financial reporting screens)
- Log this prompt in prompt-log.json
```

#### 10.4 Advanced Reporting Platform
```
Implement comprehensive reporting platform with saved reports and scheduling.
- Create report management dashboard with glassmorphism
- Implement report saving, scheduling and sharing
- Add report parameter customization interface
- Enable report export in multiple formats
- Implement report notification system
- Reference: Product Specification (Reporting & Analytics), API Documentation (Report Management), UI Specifications
- Log this prompt in prompt-log.json
```

#### 10.5 Report Dashboard
```
Implement a dashboard for report overview and quick access.
- Create report dashboard with key metrics
- Add report favorites and recent reports section
- Implement customizable dashboard widgets
- Apply glassmorphism styling to dashboard components
- Reference: Product Specification (Reporting & Analytics), API Documentation (Report Dashboard Data), UI Specifications
- Log this prompt in prompt-log.json
```

#### 10.6 Time Reports
```
Implement time reporting features in both API and UI.
- Create time summary and detail reports with Ag-Grid
- Add client hours and utilization reports
- Implement advanced filtering and data grouping
- Add export capabilities for time data
- Apply glassmorphism styling to report components
- Reference: Product Specification (Time Reports), Database Design, API Documentation (Time-Related Reports), UI Specifications
- Log this prompt in prompt-log.json
```

---

## Phase 5: Enhanced UI & PWA

### 11. PWA & Notifications

#### 11.1 Environment Configuration
```
Set up environment configuration for dev, staging, and production (both Angular and Laravel).
- Reference: Product Specification (Technical Requirements)
- Log this prompt in prompt-log.json
```

#### 11.3 Advanced PWA Offline Capabilities
```
Enhance PWA with advanced offline functionality.
- Implement offline time entry capabilities
- Add background sync for offline data
- Create offline-first data handling strategy
- Implement notification for sync status
- Develop conflict resolution for offline entries
- Add storage management for offline data
- Optimize performance for slower mobile connections
- Reference: Product Specification (Progressive Web App Capabilities), API Documentation (PWA endpoints), UI Specifications (Mobile & PWA Experience)
- Log this prompt in prompt-log.json
```

#### 11.4 Notification System
```
Implement notification system (in-app, email) in both API and UI.
- Create in-app notification center with glassmorphism
- Implement real-time notification alerts
- Design glassmorphism notification components
- Reference: Product Specification (Notifications), API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

---

## Phase 6: Quality & Deployment

### 12. Testing & Quality

#### 12.1 Unit & Integration Tests
```
Write unit and integration tests for all modules (API and UI).
- Test glassmorphism components
- Validate cost calculations
- Test PWA functionality
- Reference: Product Specification (Testing Requirements), API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 12.2 End-to-End (E2E) Tests
```
Write E2E tests for critical user flows (login, project/task/time entry, reports).
- Test complete workflows through the UI
- Validate responsive behavior on different devices
- Reference: Product Specification (Testing Requirements), UI Specifications
- Log this prompt in prompt-log.json
```

#### 12.3 Edge Case Testing and Handling
```
Implement robust edge case handling throughout the application.
- Create comprehensive test cases for boundary conditions
- Implement proper validation and error handling for all inputs
- Test and handle network failures gracefully
- Implement proper state recovery for interrupted operations
- Add comprehensive error messages for all potential failure scenarios
- Reference: Product Specification, API Documentation, UI Specifications
- Log this prompt in prompt-log.json
```

#### 12.4 Performance Testing and Optimization
```
Implement performance testing and optimization to meet technical requirements.
- Create performance benchmarks for critical operations
- Implement database query optimization
- Add front-end performance optimization (lazy loading, code splitting, etc.)
- Create load testing scripts for simulating concurrent users
- Optimize glassmorphism effects for performance
- Reference: Product Specification (Performance Requirements), UI Specifications
- Log this prompt in prompt-log.json
```

### 13. Documentation & Logging

#### 13.1 Update Documentation
```
Update all documentation files after any major change (Product Spec, DB Design, API Docs, UI Specs).
- Document glassmorphism design system
- Document PWA capabilities
- Reference: All documentation files
- Log this prompt in prompt-log.json
```

### 14. Support & Maintenance

#### 14.1 Support & Maintenance
```
Document support and maintenance procedures for TrackrEdge.
- Reference: Product Specification (Support & Maintenance)
- Log this prompt in prompt-log.json
```

---

## Utility Prompts (Use As Needed)

#### U1. Log Prompt Execution
```
Log the following prompt in prompt-log.json:
- [PASTE PROMPT HERE]
- Include: timestamp, execution time, description, tools used, AI model, files modified
```

#### U2. Debugging
```
Debug issue: [ISSUE_DESCRIPTION]
- Reference: Relevant documentation and code
- Log this prompt in prompt-log.json
``` 