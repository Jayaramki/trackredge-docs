# TrackrEdge UI Specifications

## How to Use
- For all actionable steps, workflows, and development tasks, refer to the [TrackrEdge Prompt List](TrackrEdge-Prompt-List.md).
- All changes and implementations should be logged in `prompt-log.json` as per the prompt list instructions.
- This ensures consistency and traceability for all UI work.

## Modern Design System With Glassmorphism

TrackrEdge implements a cutting-edge glassmorphism design system to create a visually stunning, modern interface that stands apart from traditional boring admin dashboards.

### Key Glassmorphism Design Principles
- **Frosted Glass Effect**: Semi-transparent surfaces with blur effects that create depth
- **Subtle Borders**: Light borders (1-2px) to define elements without being harsh
- **Multi-layered Interface**: Content panels floating above vibrant gradient backgrounds
- **Subtle Shadows**: Soft shadows to enhance the floating glass effect
- **Colorful Accents**: Vibrant accent colors against neutral backgrounds
- **Rounded Corners**: Generous border radius (12-16px) on all containers
- **Thin Typography**: Light/medium weight sans-serif fonts for a modern feel
- **Colorful Gradients**: Subtle gradients in backgrounds to create visual interest
- **Micro-interactions**: Smooth hover states and transitions

### Color Palette
- **Primary**: #5E60CE (vibrant purple)
- **Secondary**: #64DFDF (bright turquoise)
- **Background Gradient**: Linear gradient from #111133 to #2E2E5A
- **Glass Surfaces**: rgba(255, 255, 255, 0.15) with backdrop-filter: blur(10px)
- **Text**: #FFFFFF on dark surfaces, #18192F on light surfaces
- **Accent Colors**: #FF5678 (coral), #7400B8 (deep purple), #80FFDB (mint)

### Multi-Tenancy UI Considerations

#### Tenant Context Visualization
- **Tenant Indicator**: Subtle tenant name/logo in top navigation
- **Subdomain Display**: Visual confirmation of current tenant context
- **Theme Variations**: Support for tenant-specific color schemes (future)
- **Branding Areas**: Designated spaces for tenant branding elements

```
+----------------------------------+
|  [Top Navigation Bar]            |
|  +----------------------------+  |
|  | [Tenant: TenantName     ]  |  |
|  | [tenant1.trackredge.com  ]  |  |
|  +----------------------------+  |
|                                  |
|  [Content Area]                  |
+----------------------------------+
```

#### Tenant-Aware Components
- **Data Grids**: All Ag-Grid instances automatically scoped to tenant
- **Dropdowns**: Selection components filtered by tenant context
- **Forms**: Hidden tenant context in all form submissions
- **Reports**: Tenant-specific data visualization
- **Exports**: Tenant branding in exported documents

#### Error Handling
- **Tenant Not Found**: Custom 404 page with tenant context
- **Invalid Tenant**: Clear error message with support contact
- **Expired Subscription**: Graceful notification of tenant status
- **Domain Mismatch**: Helpful redirect suggestions

#### Security Considerations
- **Visual Isolation**: No cross-tenant data visibility
- **Clear Context**: Always show current tenant context
- **Access Indicators**: Visual cues for tenant-specific permissions
- **Switching Warning**: Alert when changing tenant context

### Component Design Standards
- **Cards**: Frosted glass panels with 15px border radius and subtle white borders
- **Buttons**: Gradient-filled or outlined with glass effect on hover
- **Forms**: Minimal inputs with bottom borders or glass-like input fields
- **Tables**: Rows with alternating transparency levels
- **Charts**: Vibrant colors with glass-like overlays and gradient fills
- **Search & Selection Components**: Standardized glass search with autocomplete and hierarchical selection

#### Glass Search Component
```
+----------------------------------+
|  [Label]                         |
|  [Search Field        ▼]         |
|   +------------------------+     |
|   | [Search Input...     ] |     |
|   |                        |     |
|   | [Option Group 1      ] |     |
|   |   [Option 1.1        ] |     |
|   |   [Option 1.2        ] |     |
|   |                        |     |
|   | [Option Group 2      ] |     |
|   |   [Option 2.1        ] |     |
|   |   [Option 2.2        ] |     |
|   +------------------------+     |
+----------------------------------+
```

- **Visual Properties**:
  * Frosted glass dropdown with 70% opacity
  * Backdrop blur effect (10px)
  * Subtle inner shadow (0 0 5px rgba(255,255,255,0.2))
  * Border radius matching other components (15px)
  * Soft glow on focus (0 0 15px primary color)

- **Interactive Features**:
  * Instant filtering as users type
  * Hierarchical display with expand/collapse animations
  * Keyboard navigation with visual focus indicators
  * Selection with subtle confirmation animation
  * Recent/frequently used items shown first

- **Variations**:
  * Basic Selection (single level options)
  * Hierarchical Selection (parent/child relationships)
  * Multi-Selection (with glass checkboxes)
  * Cascading Selection (selections affecting related fields)

- **Access Control & Filtering**:
  * Context-aware listings based on user permissions
  * Only displaying assigned/accessible items to each user
  * Visual indicators for item access levels (if applicable)
  * Permission-based sorting of search results

### Data Grid Component - Ag-Grid
TrackrEdge uses Ag-Grid for all listing screens and data tables throughout the application. This enterprise-grade grid component is customized to conform to our glassmorphism design system.

#### Ag-Grid Glassmorphism Customization
- **Glass Effect Container**: The grid container has the frosted glass effect with backdrop-filter blur
- **Semi-Transparent Rows**: Alternating row transparency for improved readability (rgba(255, 255, 255, 0.07) and rgba(255, 255, 255, 0.12))
- **Subtle Grid Lines**: Almost transparent grid lines (rgba(255, 255, 255, 0.15))
- **Custom Headers**: Gradient background headers with frosted glass effect
- **Hover States**: Rows illuminate with subtle glow on hover
- **Selection Highlight**: Selected rows use primary color gradient with increased opacity
- **Custom Scrollbars**: Thin, semi-transparent scrollbars with glow effect on hover
- **Filter Panels**: Floating glass panels for column filters
- **Pagination Controls**: Custom glassmorphic pagination components

#### Ag-Grid Features Utilized
- Advanced filtering and sorting
- Row selection and bulk actions
- Pagination with customizable page sizes
- Resizable and reorderable columns
- Cell renderers for custom data visualization
- Export functionality (CSV, Excel)
- Responsive behavior for different screen sizes
- Keyboard navigation support

## 1. Login & Authentication

### 1.1 Login Screen
```
+----------------------------------+
|                                  |
|     [Vibrant Gradient BG]        |
|                                  |
|   +-------------------------+    |
|   |      TrackrEdge        |    |
|   |                        |    |
|   |  [Frosted Glass Panel] |    |
|   |                        |    |
|   |  +------------------+  |    |
|   |  |    Username      |  |    |
|   |  +------------------+  |    |
|   |                        |    |
|   |  +------------------+  |    |
|   |  |    Password      |  |    |
|   |  +------------------+  |    |
|   |                        |    |
|   |  [ ] Remember Me       |    |
|   |                        |    |
|   |  [Gradient Login Btn]  |    |
|   |                        |    |
|   |  Forgot Password?      |    |
|   +-------------------------+    |
|                                  |
+----------------------------------+
```

#### Components
- Vibrant gradient background
- Frosted glass login panel with subtle border
- Semi-transparent input fields with glow effect on focus
- Gradient-filled login button with hover animation
- Remember Me checkbox with custom glass-style design
- Floating particles or subtle animated shapes in background

## 2. Dashboard

### 2.1 Main Dashboard
```
+----------------------------------+
|  [Frosted Glass Top Nav]         |
|----------------------------------|
|                                  |
|  [Side Panel]   [Main Content]   |
|  +--------+     +--------------+ |
|  |        |     |              | |
|  | [Glass |     | [Welcome    | |
|  |  Menu] |     |  Banner]    | |
|  |        |     |              | |
|  +--------+     +--------------+ |
|                                  |
|                [Floating Cards]  |
|            +-------+  +-------+  |
|            |Project|  |Time   |  |
|            |Status |  |Summary|  |
|            +-------+  +-------+  |
|                                  |
|            +-------+  +-------+  |
|            |Recent |  |Tasks  |  |
|            |Activity  |To Do  |  |
|            +-------+  +-------+  |
|                                  |
|            [Animated Charts]     |
|            +------------------+  |
|            |Weekly Activity   |  |
|            |[Gradient Chart]  |  |
|            +------------------+  |
|                                  |
|            [Quick Log Widget]    |
|            +------------------+  |
|            |Log Time Quickly  |  |
|            |Task: [Select ▼]  |  |
|            |Hours:[1h|2h|4h|8h]  |
|            |Date: Today|Yesterday|
|            |[    Log Time    ]   |
|            +------------------+  |
|                                  |
+----------------------------------+
```

### 2.1.1 Permission-Based Navigation Menu
```
+----------------------------------+
|  [Glass Side Navigation]         |
|  +----------------------------+  |
|  | [App Logo]                 |  |
|  | [User Profile Preview]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Dashboard]                |  |
|  | [Timesheet]                |  |
|  | [Projects]                 |  |
|  | [Reports]                  |  |
|  +----------------------------+  |
|                                  |
|  ✓ Shown to ALL users           |
|                                  |
|  +----------------------------+  |
|  | [Clients]                  |  |
|  | [Products]                 |  |
|  +----------------------------+  |
|                                  |
|  ✓ Shown to users with          |
|    Client/Product module access  |
|                                  |
|  +----------------------------+  |
|  | [Users]                    |  |
|  | [Roles]                    |  |
|  | [Cost Management]          |  |
|  +----------------------------+  |
|                                  |
|  ✓ Shown to Admin users only    |
|                                  |
+----------------------------------+
```

#### Permission-Based Menu Features
- **Dynamic Menu Rendering**: Menu items are only displayed if the user has access to the corresponding module
- **Visual Access Indicators**:
  * Slight opacity reduction for menu items with limited access
  * Visual indicators for admin-only sections (subtle glow or icon)
- **Permission Inheritance**:
  * Sub-menu items inherit parent menu visibility rules
  * Related features grouped under appropriate parent menus
- **Access Level Visualization**:
  * View-only access indicated with eye icon
  * Edit access indicated with pen icon
  * Full control access has no special indicator
- **Glassmorphism Elements**:
  * Menu separators use gradient dividers between permission groups
  * Current section has increased opacity and glow effect
  * Hover states include permission-appropriate visual feedback

#### Permission Management Implementation
- Menu visibility controlled by user role permissions stored in database
- Real-time permission updates when role changes
- Cached permission checks for performance optimization
- Fallback to basic navigation for edge cases
- Error handling for permission conflicts

#### Dashboard Layout Variants
- **Masonry Layout**: Irregularly sized glass panels in an asymmetric grid
- **Floating Islands**: Clustered card groups that appear to float at different depths
- **Connected Panels**: Glass cards with connecting animated lines showing data relationships
- **Expandable Widgets**: Cards that expand with animations to show more details

#### Glass Card Components
- **Welcome Banner**: Personalized greeting with time-based messages and current stats
- **Project Status**: Circular progress indicators with gradient fills
- **Time Summary**: Weekly hours visualization with colorful bar charts
- **Recent Activity**: Timeline with glass-effect activity cards
- **Tasks To Do**: Interactive task list with priority indicators
- **Weekly Activity**: Animated area chart with gradient fill

#### Interaction Features
- Parallax effect when scrolling (subtle depth movement)
- Cards slightly tilt on hover (3D effect)
- Smooth transitions between dashboard sections
- Floating notification system with glass-style alerts
- Quick action glass panels that expand on hover

### 2.2 Dashboard Layout Variants
- **Masonry Layout**: Irregularly sized glass panels in an asymmetric grid
- **Floating Islands**: Clustered card groups that appear to float at different depths
- **Connected Panels**: Glass cards with connecting animated lines showing data relationships
- **Expandable Widgets**: Cards that expand with animations to show more details

## 3. Project Management

### 3.1 Project List
```
+----------------------------------+
|  [Frosted Glass Header]          |
|  Projects  |  + New Project      |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Project Card]       |  |
|  | Project Name               |  |
|  | Status: Active             |  |
|  | +---------------------+    |  |
|  | | [Gradient Progress Bar]  |  |
|  | +---------------------+    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Project Card]       |  |
|  | Project Name               |  |
|  | Status: Planning           |  |
|  | +---------------------+    |  |
|  | | [Gradient Progress Bar]  |  |
|  | +---------------------+    |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### Project Card Features
- Translucent glass cards with subtle borders
- Status indicator with colored glow effect
- Progress bar with gradient fill
- Hover state with elevation increase and glow
- Quick-access action buttons that appear on hover

### 3.2 Project Details
```
+----------------------------------+
|  [Glass Project Header]          |
|  Project Name                    |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Overview  |  Tasks  |  Phases   |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel with Blur]    |  |
|  | Project Details            |  |
|  | - Start/End Dates          |  |
|  | - [Status Pill]            |  |
|  | - [Circular Progress]      |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Timeline Card]      |  |
|  | Recent Activity            |  |
|  | - [Activity Stream]        |  |
|  | - [User Avatars]           |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

### 3.3 Task Management
```
+----------------------------------+
|  Tasks                           |
|----------------------------------|
|  + New Task                      |
|                                  |
|  Filters:                        |
|  Status: [ All ▼ ]              |
|  Phase:  [ All ▼ ]              |
|                                  |
|  +----------------------------+  |
|  | Task Title                 |  |
|  | Status: In Progress       |  |
|  | Phase: Development        |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | Task Title                 |  |
|  | Status: New               |  |
|  | Phase: Planning           |  |
|  +----------------------------+  |
+----------------------------------+
```

### 3.4 Task Details
```
+----------------------------------+
|  Task: [Task Title]              |
|----------------------------------|
|                                  |
|  Status: [In Progress ▼]         |
|  Phase:  [Development ▼]         |
|                                  |
|  Tags:                           |
|  [Search tags... ▼]              |
|  [Bug] [Feature] [UI] [x]        |
|                                  |
|  Description:                    |
|  [                              ]|
|  [                              ]|
|                                  |
|  Estimated Hours: [      ]       |
|                                  |
|  +----------------------------+  |
|  | Time Entries              |  |
|  | Date | Hours | Notes      |  |
|  | 5/1  | 4.0   | Started..  |  |
|  | 5/2  | 3.0   | Continued  |  |
|  +----------------------------+  |
|                                  |
|  [Save] [Cancel]                 |
+----------------------------------+
```

### 3.5 Phase Management
```
+----------------------------------+
|  Project Phases                  |
|----------------------------------|
|  + New Phase                     |
|                                  |
|  +----------------------------+  |
|  | Phase Name: Planning       |  |
|  | Status: In Progress        |  |
|  | Start: 2024-05-01          |  |
|  | End:   2024-05-10          |  |
|  | Progress: 40%              |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | Phase Name: Development    |  |
|  | Status: Not Started        |  |
|  | Start: 2024-05-11          |  |
|  | End:   2024-05-25          |  |
|  | Progress: 0%               |  |
|  +----------------------------+  |
+----------------------------------+
```

### 3.6 Clone Project Dialog
```
+----------------------------------+
|  [Glass Header]                  |
|  Clone Project                   |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Form Panel]         |  |
|  |                            |  |
|  | Source Project:            |  |
|  | Project Name               |  |
|  |                            |  |
|  | New Project Name:          |  |
|  | [________________________] |  |
|  |                            |  |
|  | New Description:           |  |
|  | [________________________] |  |
|  | [________________________] |  |
|  |                            |  |
|  | Start Date:                |  |
|  | [__/__/____] (Calendar)    |  |
|  |                            |  |
|  | End Date:                  |  |
|  | [__/__/____] (Calendar)    |  |
|  |                            |  |
|  | Include:                   |  |
|  | [x] Project Phases         |  |
|  | [x] Tasks                  |  |
|  | [x] Team Members           |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Clone Project] [Cancel]        |
+----------------------------------+
```

The Clone Project dialog incorporates glassmorphism styling with:
- Frosted glass header and main panel
- Semi-transparent form elements with subtle blur effects
- Light borders around panels and inputs
- Elegant checkbox styling with frosted glass backgrounds
- Soft shadows to create depth and a floating appearance

**Key Features:**
- Source project information display
- Customizable new project fields
- Selectable elements to include in the clone
- Adjustable project dates
- Visual feedback on hover and focus states
- Logical tab ordering for keyboard navigation

When a user requests to clone a project, this modal dialog appears with pre-filled information from the source project, allowing for quick customization before creating the clone.

## 4. Timesheet Management

### 4.1 Time Entry
```
+----------------------------------+
|  Log Time                        |
|----------------------------------|
|                                  |
|  Project: [Select Project ▼]     |
|  Task:    [Select Task ▼]        |
|                                  |
|  Date:    [2024-05-15]           |
|  Hours:   [4.5]                  |
|                                  |
|  Notes:                          |
|  [                              ]|
|  [                              ]|
|                                  |
|  [x] Billable                    |
|                                  |
|  [Log Time]                      |
+----------------------------------+
```

### 4.2 Weekly Timesheet
```
+----------------------------------+
|  [Glass Header Panel]            |
|  Weekly Timesheet                |
|----------------------------------|
|  Week: [Glass Dropdown]          |
|  [Glass Button] [Glass Button]   |
|                                  |
|  Status: [Glowing Status Pill]   |
|                                  |
|  +----------------------------+  |
|  | [Glass Table with Blur]    |  |
|  | Task | Mon | Tue | Wed | .. |  |
|  |------|-----|-----|-----|----| |
|  | Task1| 4.0 | 3.5 | 2.0 | .. |  |
|  | Task2| 4.0 | 4.5 | 6.0 | .. |  |
|  |------|-----|-----|-----|----| |
|  | [Gradient Total Row]       |  |
|  | Total| 8.0 | 8.0 | 8.0 | .. |  |
|  +----------------------------+  |
|                                  |
|  [Floating Action Button]        |
|                                  |
|  [Gradient Submit Button]        |
+----------------------------------+
```

#### Timesheet Glass Features
- Semi-transparent table with alternating row opacity
- Interactive cells that elevate and glow on hover/selection
- Floating add task button with glass effect
- Gradient submit button with animation on hover
- Dynamic color coding based on hours (gradients shift with values)
- Day columns with subtle day/date headers

### 4.3 Bulk Edit Interface
```
+----------------------------------+
|  Bulk Edit Time Entries          |
|----------------------------------|
|                                  |
|  Selected: 10 cells              |
|                                  |
|  Action:                         |
|  (•) Set hours: [8.0]            |
|  ( ) Clear hours                 |
|  ( ) Distribute hours: [40.0]    |
|                                  |
|  [x] Apply to billable only      |
|                                  |
|  [Apply] [Cancel]                |
+----------------------------------+
```

### 4.4 Clone Previous Entries
```
+----------------------------------+
|  Clone Previous Week             |
|----------------------------------|
|                                  |
|  Source Week: [May 3-9, 2024 ▼]  |
|                                  |
|  Options:                        |
|  [x] Include all tasks           |
|  [x] Include hours               |
|  [ ] Include notes               |
|                                  |
|  Preview:                        |
|  +----------------------------+  |
|  | Task | Mon | Tue | Wed | .. |  |
|  |------|-----|-----|-----|----| |
|  | Task1| 4.0 | 3.5 | 2.0 | .. |  |
|  | Task2| 4.0 | 4.5 | 6.0 | .. |  |
|  +----------------------------+  |
|                                  |
|  [Clone] [Cancel]                |
+----------------------------------+
```

### 4.5 Timesheet Templates

#### 4.5.1 Template List
```
+----------------------------------+
|  Timesheet Templates             |
|----------------------------------|
|                                  |
|  Filter: [All Types ▼]           |
|  + Create New Template           |
|                                  |
|  +----------------------------+  |
|  | [Glass Template Card]      |  |
|  | Standard Week Pattern      |  |
|  | Type: Personal             |  |
|  | Last Used: May 10, 2024    |  |
|  | [Apply] [Edit] [Delete]    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Template Card]      |  |
|  | Project X Focus            |  |
|  | Type: Team                 |  |
|  | Created by: Admin          |  |
|  | [Apply] [View]             |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### 4.5.2 Create/Edit Template
```
+----------------------------------+
|  Edit Template                   |
|----------------------------------|
|                                  |
|  Name: [Standard Work Week     ] |
|  Description: [Default pattern ] |
|                                  |
|  Type: (•) Personal ( ) Team     |
|                                  |
|  +----------------------------+  |
|  | [Glass Template Editor]    |  |
|  | Task | Mon | Tue | Wed | .. |  |
|  |------|-----|-----|-----|----| |
|  | Task1| 4.0 | 3.5 | 2.0 | .. |  |
|  | Task2| 4.0 | 4.5 | 6.0 | .. |  |
|  | + Add Task                 |  |
|  +----------------------------+  |
|                                  |
|  - or -                          |
|                                  |
|  [Copy from Existing Week ▼]     |
|                                  |
|  [Save Template] [Cancel]        |
+----------------------------------+
```

#### 4.5.3 Apply Template
```
+----------------------------------+
|  Apply Template                  |
|----------------------------------|
|                                  |
|  Template: Standard Work Week    |
|                                  |
|  Apply to Week: [Select Week ▼]  |
|                                  |
|  Options:                        |
|  ( ) Merge with existing entries |
|  (•) Replace existing entries    |
|                                  |
|  Preview:                        |
|  +----------------------------+  |
|  | [Template Preview Grid]    |  |
|  +----------------------------+  |
|                                  |
|  [Apply Template] [Cancel]       |
+----------------------------------+
```

### 4.6 Timesheet Approval
```
+----------------------------------+
|  Approve Timesheets              |
|----------------------------------|
|                                  |
|  Week: [May 10 - May 16, 2024 ▼] |
|  User: [Select User ▼]           |
|                                  |
|  Status: Submitted on May 16     |
|  40-Hour Check: [40hrs ✓]        |
|                                  |
|  +----------------------------+  |
|  | Task | Mon | Tue | Wed | .. |  |
|  |------|-----|-----|-----|----| |
|  | Task1| 4.0 | 3.5 | 2.0 | .. |  |
|  | Task2| 4.0 | 4.5 | 6.0 | .. |  |
|  |------|-----|-----|-----|----| |
|  | Total| 8.0 | 8.0 | 8.0 | .. |  |
|  +----------------------------+  |
|                                  |
|  Comments:                       |
|  [                              ]|
|                                  |
|  [Approve] [Request Changes]     |
+----------------------------------+
```

#### Components
- Week selector
- User selector
- Status information
- 40-hour compliance check
- Task grid (read-only)
- Comments field
- Action buttons

### 4.7 Comprehensive Timesheet Views

#### 4.7.1 Monthly Timesheet View
```
+----------------------------------+
|  [Glass Header]                  |
|  May 2025                        |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  MONTH | WEEK | DAY | LIST       |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Calendar Grid]      |  |
|  | S | M | T | W | T | F | S  |  |
|  |---|---|---|---|---|---|----| |
|  |   |   |   | 1 | 2 | 3 | 4  |  |
|  | 5 | 6 | 7 | 8 | 9 |10 |11  |  |
|  |12 |13 |14 |15 |16 |17 |18  |  |
|  |19 |20 |21 |22 |23 |24 |25  |  |
|  |26 |27 |28 |29 |30 |31 |    |  |
|  +----------------------------+  |
|                                  |
|  [Glass Summary Panel]           |
|  +----------------------------+  |
|  | HOURS SUMMARY    | 24.50  |  |
|  | TOTAL HOURS                |  |
|  |                            |  |
|  | [Glass Bar Charts]         |  |
|  | Client Billable   | 0.00   |  |
|  | Client Non-Bill   | 0.50   |  |
|  | Internal          | 8.00   |  |
|  | Time Off          | 16.00  |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | APPROVAL STATUS            |  |
|  | [Gradient Progress Bar]    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | UTILIZATION                |  |
|  | Billable: 0.0%             |  |
|  | Target: 0.0%               |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### 4.7.2 Weekly Timesheet View
```
+----------------------------------+
|  [Glass Header]                  |
|  May 5 - May 11, 2025            |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  MONTH | WEEK | DAY | LIST       |
|----------------------------------|
|                                  |
|  [Glass Status Pill: Not Submitted] |
|                                  |
|  +----------------------------+  |
|  | [Glass Time Entry Grid]    |  |
|  |                            |  |
|  | Project/Task | M | T | W | T | F | S | S | TOTAL |
|  |--------------|---|---|---|---|---|---|---|-------| 
|  | Aspire/Scrum |0.5|   |   |   |   |   |   | 0.50  |
|  | Inatech/Bug  |8.0|   |   |   |   |   |   | 8.00  |
|  | Time Off     |   |   |   |   |8.0|   |   | 8.00  |
|  |--------------|---|---|---|---|---|---|---|-------| 
|  | Daily Total  |8.5| 0 | 0 | 0 | 8 | 0 | 0 | 16.50 |
|  +----------------------------+  |
|                                  |
|  [Glass Action Buttons]          |
|  [+ Add Time Row] [Copy Last Week's Rows] [Submit Timesheet]
|                                  |
|  [Glass Summary Panel]           |
|  +----------------------------+  |
|  | HOURS SUMMARY     | 16.50  |  |
|  | TOTAL HOURS                |  |
|  |                            |  |
|  | [Glass Bar Charts]         |  |
|  | Client Billable   | 0.00   |  |
|  | Client Non-Bill   | 0.50   |  |
|  | Internal          | 8.00   |  |
|  | Time Off          | 8.00   |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### 4.7.3 Daily Timesheet View
```
+----------------------------------+
|  [Glass Header]                  |
|  Tuesday, May 6, 2025            |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  MONTH | WEEK | DAY | LIST       |
|----------------------------------|
|                                  |
|  [Glass Status Pill: Not Submitted] |
|                                  |
|  [Glass Day Summary Bar]         |
|  MON | TUE | WED | THU | FRI | SAT | SUN | TOTAL
|  8:30 | 0:00 | 0:00 | 0:00 | 8:00 | 0:00 | 0:00 | 16:30
|  5/5  | 5/6  | 5/7  | 5/8  | 5/9  | 5/10 | 5/11 |
|                                  |
|  +----------------------------+  |
|  | [Glass Empty State Panel]  |  |
|  | No time entries available  |  |
|  | for Tuesday, May 6, 2025   |  |
|  |                            |  |
|  | [New Time Entry] [Submit]  |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### 4.7.4 List Timesheet View
```
+----------------------------------+
|  [Glass Header]                  |
|  Time Entries                    |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  MONTH | WEEK | DAY | LIST       |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Date Divider]       |  |
|  | Tuesday, May 6, 2025: Today|  |
|  | 0:00 HRS          [+ Add] |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Date Divider]       |  |
|  | Monday, May 5, 2025        |  |
|  | 8:30 HRS          [+ Add] |  |
|  |                            |  |
|  | [Glass Entry Panel]        |  |
|  | Aspire Software            |  |
|  | Internal - Product         |  |
|  | Daily standup - Scrums     |  |
|  | "Daily Standup call"       |  |
|  | 0:30                [Play] |  |
|  |                            |  |
|  | [Glass Entry Panel]        |  |
|  | Inatech                    |  |
|  | PS Non-Release Defect fixing|  |
|  | "Backend changes implemented|  |
|  | to fix Bug 60989..."       |  |
|  | 8:00                [Play] |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Date Divider]       |  |
|  | Thursday, May 1, 2025      |  |
|  | 8:00 HRS          [+ Add] |  |
|  | May Day (AUNT/CN/FI/IN)    |  |
|  +----------------------------+  |
|                                  |
|  [Glass Action Button]           |
|  [+ New Time Entry]              |
|                                  |
+----------------------------------+
```

#### 4.7.5 Timesheet View Features
- **Consistent Glassmorphism**: All views share the same frosted glass aesthetic
- **View Transitions**: Smooth fade/slide animations when switching between views
- **Interactive Elements**: 
  * Day cells glow on hover in month view
  * Time cells elevate slightly when editable in weekly view
  * Entry cards expand with subtle animations in list view
- **Status Visualization**:
  * Gradient-filled status pills show submission/approval state
  * Color-coded time categories (billable, non-billable, etc.)
  * Animated progress indicators for utilization and approval status
- **Responsive Adaptation**:
  * Monthly view shifts to agenda format on smaller screens
  * Weekly view collapses to scrollable format for mobile
  * List view maintains functionality across all device sizes

#### 4.7.6 Period Navigation Controls
```
+----------------------------------+
|  [Glass Header]                  |
|  <    Tue, May 6, 2025    >      |
|  [◀]   [Date Navigation]   [▶]   |
|  [Calendar Icon]                 |
|----------------------------------|
```

- **Glass Navigation Buttons**:
  * Semi-transparent previous/next buttons with frosted glass effect
  * Subtle glow on hover and press states
  * Smooth transition animations between periods
  * Calendar icon for direct date selection

- **Date Navigation Types**:
  * Monthly: < April 2025 | May 2025 | June 2025 >
  * Weekly: < Apr 28-May 4 | May 5-11 | May 12-18 >
  * Daily: < Monday, May 5 | Tuesday, May 6 | Wednesday, May 7 >
  
- **Calendar Date Picker**:
  * Glass-effect calendar popup on icon click
  * Gradient highlights for current/selected dates
  * Quick period selection (today, this week, this month)
  * Animation for calendar appearance/disappearance

### 4.8 Timesheet Listing Screens

#### 4.8.1 Timesheet List View
```
+----------------------------------+
|  [Frosted Glass Top Nav]         |
|  [Search]        [User Profile]  |
|----------------------------------|
|                                  |
|  [Side Nav]    [Main Content]    |
|  +--------+     +--------------+ |
|  |        |     | Timesheets   | |
|  | [Glass |     |              | |
|  |  Menu] |     | [Tabs Bar]   | |
|  |        |     | Open|Submitted| |
|  | Home   |     |  Approve|All | |
|  |        |     +--------------+ |
|  | Projects     | [Filter Area]  |
|  |        |     | Date|Project|  |
|  | → Time |     | Type|User|     |
|  |        |     | [Bulk Actions] |
|  |   more |     +--------------+ |
|  +--------+     | [Data Table]   |
|                 | ☐ Date Name    |
|                 | ☐ 4/28 April   |
|                 | ☐ 4/28 May     |
|                 | Export ↓       |
|                 +--------------+ |
|                 | [Pagination]   |
|                 +--------------+ |
+----------------------------------+
```

The Timesheet List View provides a comprehensive overview of all timesheets with powerful filtering, sorting, and bulk action capabilities. This screen incorporates our glassmorphism design language while maintaining a focus on usability.

```jsx
<GlassContainer>
  <Header>
    <Logo />
    <GlobalSearch type="expandable">
      <SearchTypeSelector options={["All", "Clients", "Projects", "Tasks"]} />
    </GlobalSearch>
    <NotificationIcon count={unreadNotifications} />
    <ProfileMenu />
  </Header>

  <SideNav selectedItem="timesheets" />

  <MainContent>
    <PageTitle>Timesheets</PageTitle>

    <GlassTabBar>
      <GlassTab active={true}>Open</GlassTab>
      <GlassTab>Submitted</GlassTab>
      <GlassTab>To Approve</GlassTab>
      <GlassTab>Approved</GlassTab>
      <GlassTab>Rejected</GlassTab>
      <GlassTab>Archived</GlassTab>
      <GlassTab>All</GlassTab>
    </GlassTabBar>

    <GlassPanel>
      <FilterArea>
        <DateRangeSelector />
        <FilterSelector label="Project" />
        <FilterSelector label="Time Type" />
        <FilterSelector label="Member" />
        <BulkActionArea>
          <DropdownButton label="Bulk Actions">
            <ActionItem>Submit Selected</ActionItem>
            <ActionItem>Approve Selected</ActionItem>
            <ActionItem>Reject Selected</ActionItem>
            <ActionItem>Delete Selected</ActionItem>
          </DropdownButton>
        </BulkActionArea>
      </FilterArea>

      <DataTable>
        <SelectionColumn />
        <Column field="start_date" header="Start Date" sortable={true} />
        <Column field="name" header="Name" sortable={true} />
        <Column field="user" header="User" sortable={true} filterable={true} />
        <Column field="hours" header="# of Hours" sortable={true} />
        <Column field="status" header="Status" sortable={true} filterable={true} />
        <ActionColumn />
      </DataTable>

      <Pagination />
    </GlassPanel>
  </MainContent>
</GlassContainer>
```

#### 4.8.2 Timesheet Status Visualization

**Glassmorphism Timesheet List Features**
- Frosted glass panels with gradient backdrop
- Multi-layered interface with depth effects
- Translucent filter components that blur content beneath
- Tab indicators with gradient highlighting
- Hover effects that increase panel translucency
- Card-based timesheet entries with shadow elevations

**Status Badges with Gradient Styling**
- **Open**: Blue gradient (#4299E1 to #3182CE)
- **Submitted**: Purple gradient (#9F7AEA to #805AD5)
- **Approved**: Green gradient (#48BB78 to #38A169)
- **Rejected**: Red gradient (#F56565 to #E53E3E)
- **Archived**: Gray gradient (#A0AEC0 to #718096)

Status changes trigger subtle animations with a ripple effect that radiates from the center of the badge, providing visual feedback when a timesheet's status is updated.

#### 4.8.3 Timesheet Approval List View

```
+----------------------------------+
|  [Frosted Glass Top Nav]         |
|  [Search]        [User Profile]  |
|----------------------------------|
|                                  |
|  [Side Nav]    [Main Content]    |
|  +--------+     +--------------+ |
|  |        |     | Timesheet    | |
|  | [Glass |     | Approvals    | |
|  |  Menu] |     |              | |
|  |        |     | [Filter Area]  |
|  | Home   |     | Date|Approver| |
|  |        |     | Project|Type | |
|  | Projects     | Member|Locked | |
|  |        |     | Show Notes ☐ | |
|  | → Time |     +--------------+ |
|  |  → Approval   | [Data Table]   |
|  |   more |     | ☐ Member Items |
|  +--------+     | No results     |
|                 |                |
|                 |                |
|                 | Export ↓       |
|                 +--------------+ |
|                 | 0 Time Entries |
|                 +--------------+ |
+----------------------------------+
```

```jsx
<GlassContainer>
  <Header>
    <Logo />
    <GlobalSearch type="expandable">
      <SearchTypeSelector options={["All", "Clients", "Projects", "Tasks"]} />
    </GlobalSearch>
    <NotificationIcon count={unreadNotifications} />
    <ProfileMenu />
  </Header>

  <SideNav selectedItem="timesheets" subItem="approvals" />

  <MainContent>
    <PageTitle>Timesheet Approvals</PageTitle>

    <GlassPanel>
      <FilterArea>
        <DateRangeSelector 
          defaultStart="1st of current month" 
          defaultEnd="last day of current month" 
        />
        <ApproverSelector defaultValue="current user" />
        <FilterSelector label="Project" />
        <FilterSelector label="Time Type" />
        <FilterSelector label="Member" />
        <FilterSelector label="Include Locked Items" type="dropdown" options={["Yes", "No"]} />
        <ShowNotesToggle />
      </FilterArea>

      <DataTable 
        emptyMessage="No timesheets requiring approval"
        groupable={true}
        exportable={true}
      >
        <SelectionColumn />
        <Column field="member" header="Member" sortable={true} />
        <Column field="num_items" header="# of Items" sortable={true} />
        <Column field="client_billable" header="Client Billable" sortable={true} />
        <Column field="client_non_billable" header="Client Non-Billable" sortable={true} />
        <Column field="internal" header="Internal" sortable={true} />
        <Column field="time_off" header="Time Off" sortable={true} />
        <Column field="total" header="Total" sortable={true} />
        <ActionColumn />
      </DataTable>

      <Pagination />
    </GlassPanel>
  </MainContent>
</GlassContainer>
```

#### 4.8.4 Bulk Actions Management

The bulk actions feature provides powerful administrative capabilities with visual feedback:

- **Selection Experience**:
  - Glass-style checkboxes with gradient borders
  - Selection counter with animated background that intensifies as more items are selected
  - Quick selection options (All, None, Filtered, Range)

- **Action Panel**:
  - Contextual action panel slides in when items are selected
  - Actions appear as glass buttons with appropriate gradient accents
  - Hover states expand actions slightly with increased glow effects
  - Confirmation dialogs appear as floating glass panels

```jsx
<BulkActionArea visible={selectedCount > 0}>
  <SelectionCounter>
    {selectedCount} items selected
    <SelectionOptions>
      <SelectOption onClick={() => selectAll()}>All</SelectOption>
      <SelectOption onClick={() => selectNone()}>None</SelectOption>
      <SelectOption onClick={() => selectFiltered()}>Filtered</SelectOption>
    </SelectionOptions>
  </SelectionCounter>
  
  <ActionButtons>
    <GlassActionButton 
      icon="submit"
      label="Submit"
      gradientColor="purple"
      onClick={() => submitSelected()}
    />
    <GlassActionButton 
      icon="approve"
      label="Approve"
      gradientColor="green"
      onClick={() => approveSelected()}
    />
    <GlassActionButton 
      icon="reject"
      label="Reject"
      gradientColor="red"
      onClick={() => rejectSelected()}
    />
    <GlassActionButton 
      icon="export"
      label="Export"
      gradientColor="blue"
      onClick={() => exportSelected()}
    />
  </ActionButtons>
</BulkActionArea>
```

#### 4.8.5 Export Functionality

Timesheets and approval screens include powerful export capabilities:

- **Export Button**: Glass-style export button with dropdown options
- **Export Formats**: PDF, Excel, CSV, and Print options
- **Export Configuration**: Panel for selecting export options
- **Export Notifications**: Real-time status updates during export processing

```jsx
<ExportOptions>
  <GlassDropdownButton icon="export" label="Export">
    <ExportOption icon="pdf" label="Export as PDF" onClick={() => exportAsPdf()} />
    <ExportOption icon="excel" label="Export as Excel" onClick={() => exportAsExcel()} />
    <ExportOption icon="csv" label="Export as CSV" onClick={() => exportAsCsv()} />
    <ExportOption icon="print" label="Print" onClick={() => printData()} />
    <ExportOption icon="customized" label="Customized Export..." onClick={() => showExportDialog()} />
  </GlassDropdownButton>
  
  {showExportDialog && (
    <GlassDialog title="Configure Export">
      <ExportConfigForm>
        <FormField label="Format">
          <RadioButton value="pdf" label="PDF" />
          <RadioButton value="excel" label="Excel" />
          <RadioButton value="csv" label="CSV" />
        </FormField>
        
        <FormField label="Content">
          <Checkbox value="include_notes" label="Include Notes" />
          <Checkbox value="include_details" label="Include Details" />
          <Checkbox value="include_summary" label="Include Summary" checked={true} />
        </FormField>
        
        <FormField label="Date Range">
          <DateRangeSelector />
        </FormField>
        
        <FormActions>
          <GlassButton label="Cancel" onClick={() => hideExportDialog()} />
          <GlassButton primary label="Export" onClick={() => proceedWithExport()} />
        </FormActions>
      </ExportConfigForm>
    </GlassDialog>
  )}
</ExportOptions>
```

#### 4.8.6 Search Integration

The global search integration in the timesheet listing screens provides a fluid search experience with glassmorphism styling:

- **Expanding Search Field**: 
  - Initially compact, expands on focus with a smooth animation
  - Background transitions from semi-transparent to more frosted on focus
  - Search type selector slides in from the side

- **Timesheet Search Results Display**:
  - Results appear in a layered glass panel with depth effect
  - Grouped by period (This Week, Last Week, This Month)
  - Hierarchical display showing relationship between timesheets and projects
  - Hover states add glow effects and increase transparency

#### 4.8.7 Responsive Behavior

The timesheet listing screens are fully responsive with adaptive layouts:

- **Mobile View**:
  - Filters collapse into an expandable drawer
  - Table transforms into cards with swipe actions
  - Tabs become a scrollable horizontal strip
  - Search takes priority position in header

- **Tablet View**:
  - Hybrid layout with collapsible sidebar
  - Simplified table with essential columns
  - Touch-optimized filter controls

- **Desktop View**:
  - Full featured layout with all components visible
  - Advanced filtering and bulk actions
  - Keyboard shortcuts for power users

#### 4.8.8 Integration with Notification System

The timesheet listings are tightly integrated with the notification system:

- **Status Notifications**:
  - Approval notifications appear in real-time
  - Timesheet status changes trigger notification alerts
  
- **Action Required Indicators**:
  - Visual indicators for timesheets requiring attention
  - Colored badges showing count of items needing action
  
- **Notification Panel**:
  - Glass panel with timesheet-related notifications
  - Quick action buttons to respond to timesheet events
  - Gradient highlighting for priority items

This comprehensive approach to timesheet listing screens ensures a consistent, intuitive experience that follows industry patterns while delivering TrackrEdge's distinctive glassmorphism design language.

### 4.9 Quick Timesheet Access & Entry

#### 4.9.1 Header Timesheet Summary
```
+----------------------------------+
|              [Glass Header]      |
| [Logo]                      [0:00] [User Profile]
|                                  |
| [On Click: Quick Week Summary]   |
| +----------------------------+   |
| | [Glass Week Panel]         |   |
| | MON | TUE | WED | THU | FRI | SAT | SUN |
| | 8:30 |  0  |  0  |  0  |  8  |  0  |  0  |
| | [+ Quick Entry Button]     |   |
| +----------------------------+   |
|                                  |
+----------------------------------+
```

## 5. Client & Product Management

### 5.1 Client List
```
+----------------------------------+
|  [Glass Header]                  |
|  Clients  |  + New Client        |
|----------------------------------|
|                                  |
|  [Glass Filter Bar]              |
|  Filter: [   ] Status: [Active ▼]|
|                                  |
|  +----------------------------+  |
|  | [Glass Client Card]        |  |
|  | Client Name                |  |
|  | Projects: 3                |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Client Card]        |  |
|  | Client Name                |  |
|  | Projects: 1                |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
|                                  |
|  [Glass Pagination]              |
+----------------------------------+
```

#### Client List Features
- Frosted glass client cards with hover effects
- Quick action buttons that appear/glow on hover
- Filter bar with glass effect inputs
- Animated transitions between list states
- Pagination with glass-style buttons

### 5.2 Client Details
```
+----------------------------------+
|  [Glass Header]                  |
|  Client: Client Name             |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Details | Projects | Products   |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Client Information         |  |
|  | Name: Client Name          |  |
|  | Contact: John Doe          |  |
|  | Email: contact@client.com  |  |
|  | Phone: +1 234 567 8900     |  |
|  | Address: 123 Client St     |  |
|  | Status: [Active Pill]      |  |
|  +----------------------------+  |
|                                  |
|  [Glass Edit Button]             |
+----------------------------------+
```

### 5.3 Client Projects Tab
```
+----------------------------------+
|  [Glass Header]                  |
|  Client: Client Name             |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Details | Projects | Products   |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Associated Projects        |  |
|  | +------------------------+ |  |
|  | | Project A | Active     | |  |
|  | +------------------------+ |  |
|  | | Project B | Planning   | |  |
|  | +------------------------+ |  |
|  +----------------------------+  |
|                                  |
|  [Glass Add Project Button]      |
+----------------------------------+
```

### 5.4 Client Products Tab
```
+----------------------------------+
|  [Glass Header]                  |
|  Client: Client Name             |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Details | Projects | Products   |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Associated Products        |  |
|  | +------------------------+ |  |
|  | | Product X | [Remove]   | |  |
|  | +------------------------+ |  |
|  | | Product Y | [Remove]   | |  |
|  | +------------------------+ |  |
|  +----------------------------+  |
|                                  |
|  [Glass Assign Product Button]   |
+----------------------------------+
```

### 5.5 Add/Edit Client
```
+----------------------------------+
|  [Glass Header]                  |
|  Add Client                      |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Form Panel]         |  |
|  |                            |  |
|  | Client Name:               |  |
|  | [________________________] |  |
|  |                            |  |
|  | Contact Person:            |  |
|  | [________________________] |  |
|  |                            |  |
|  | Email:                     |  |
|  | [________________________] |  |
|  |                            |  |
|  | Phone:                     |  |
|  | [________________________] |  |
|  |                            |  |
|  | Address:                   |  |
|  | [________________________] |  |
|  |                            |  |
|  | Status:                    |  |
|  | [Active ▼]                 |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Save] [Cancel]                 |
+----------------------------------+
```

#### Add/Edit Client Features
- Glass form panel with subtle glow
- Frosted glass input fields with focus effects
- Floating labels that animate on focus
- Gradient save button
- Form validation with glass-style error indicators

### 5.6 Assign Product to Client
```
+----------------------------------+
|  [Glass Header]                  |
|  Assign Products to Client       |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Available Products         |  |
|  |                            |  |
|  | [Search Products...]       |  |
|  |                            |  |
|  | [ ] Product A              |  |
|  | [ ] Product B              |  |
|  | [ ] Product C              |  |
|  | [ ] Product D              |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Assign Selected] [Cancel]      |
+----------------------------------+
```

### 5.7 Product List
```
+----------------------------------+
|  [Glass Header]                  |
|  Products  |  + New Product      |
|----------------------------------|
|                                  |
|  [Glass Filter Bar]              |
|  Filter: [   ] Category: [All ▼] |
|                                  |
|  +----------------------------+  |
|  | [Glass Product Card]       |  |
|  | Product Name               |  |
|  | Category: Software         |  |
|  | Projects: 2                |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Product Card]       |  |
|  | Product Name               |  |
|  | Category: Hardware         |  |
|  | Projects: 4                |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
|                                  |
|  [Glass Pagination]              |
+----------------------------------+
```

#### Product List Features
- Frosted glass product cards with hover effects
- Category indicator with color coding
- Filter and search with glass input fields
- Quick action buttons with micro-interactions
- Sorting options with glass dropdown

### 5.8 Product Details
```
+----------------------------------+
|  [Glass Header]                  |
|  Product: Product Name           |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Details | Projects | Clients    |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Product Information        |  |
|  | Name: Product Name         |  |
|  | Category: Software         |  |
|  | Description: Lorem ipsum   |  |
|  | Price: $1000               |  |
|  | Status: [Active Pill]      |  |
|  |                            |  |
|  | [Glass Edit Button]         |  |
|  +----------------------------+  |
+----------------------------------+
```

### 5.9 Product Projects Tab
```
+----------------------------------+
|  [Glass Header]                  |
|  Product: Product Name           |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Details | Projects | Clients    |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Associated Projects        |  |
|  | +------------------------+ |  |
|  | | Project A | Active     | |  |
|  | +------------------------+ |  |
|  | | Project B | Planning   | |  |
|  | +------------------------+ |  |
|  +----------------------------+  |
|                                  |
|  [Glass Add Project Button]      |
+----------------------------------+
```

### 5.10 Product Clients Tab
```
+----------------------------------+
|  [Glass Header]                  |
|  Product: Product Name           |
|----------------------------------|
|                                  |
|  [Glass Tab Navigation]          |
|  Details | Projects | Clients    |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Panel]              |  |
|  | Associated Clients         |  |
|  | +------------------------+ |  |
|  | | Client X | [Remove]    | |  |
|  | +------------------------+ |  |
|  | | Client Y | [Remove]    | |  |
|  | +------------------------+ |  |
|  +----------------------------+  |
|                                  |
|  [Glass Assign Client Button]    |
+----------------------------------+
```

#### 6.5.1 Role List
```
+----------------------------------+
|  [Glass Header]                  |
|  Roles  |  + New Role            |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Role Card]          |  |
|  | Administrator              |  |
|  | Users: 5                   |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Role Card]          |  |
|  | Project Manager            |  |
|  | Users: 12                  |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Role Card]          |  |
|  | Developer                  |  |
|  | Users: 28                  |  |
|  | [View] [Edit] [Delete]     |  |
|  +----------------------------+  |
+----------------------------------+
```

#### 6.5.2 Role Details/Edit
```
+----------------------------------+
|  [Glass Header]                  |
|  Edit Role: Project Manager      |
|----------------------------------|
|                                  |
|  [Glass Tabs]                    |
|  Basic Info | Module Permissions |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Form Panel]         |  |
|  | Role Name:                 |  |
|  | [Project Manager_________] |  |
|  |                            |  |
|  | Description:               |  |
|  | [Managing projects and___] |  |
|  | [coordinating teams_______]|  |
|  |                            |  |
|  | Default Hourly Rate:       |  |
|  | [$35.00                  ] |  |
|  |                            |  |
|  | Status:                    |  |
|  | (•) Active ( ) Inactive    |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Save] [Cancel]                 |
+----------------------------------+
```

#### 6.5.3 Module Permissions Tab
```
+----------------------------------+
|  [Glass Header]                  |
|  Edit Role: Project Manager      |
|----------------------------------|
|                                  |
|  [Glass Tabs]                    |
|  Basic Info | Module Permissions |
|----------------------------------|
|                                  |
|  [Glass Toggle Header]           |
|  [×] Select/Deselect All Modules |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Dashboard                  |  |
|  | [×] Access Module          |  |
|  |   [×] View Own Timesheets  |  |
|  |   [×] Edit Own Timesheets  |  |
|  |   [×] View Team Timesheets |  |
|  |   [×] Approve Timesheets   |  |
|  |   [×] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Project Management         |  |
|  | [×] Access Module          |  |
|  |   [×] View Projects        |  |
|  |   [×] Create Projects      |  |
|  |   [×] Edit Projects        |  |
|  |   [×] Manage Team Members  |  |
|  |   [×] Delete Projects      |  |
|  |   [ ] View Clients         |  |
|  |   [ ] Create Clients       |  |
|  |   [ ] Edit Clients         |  |
|  |   [ ] Delete Clients       |  |
|  |   [×] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Client Management          |  |
|  | [×] Access Module          |  |
|  |   [×] View Clients         |  |
|  |   [ ] Create Clients       |  |
|  |   [ ] Edit Clients         |  |
|  |   [ ] Delete Clients       |  |
|  |   [×] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Product Management         |  |
|  | [×] Access Module          |  |
|  |   [×] View Products        |  |
|  |   [ ] Create Products      |  |
|  |   [ ] Edit Products        |  |
|  |   [ ] Delete Products      |  |
|  |   [×] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Reporting                  |  |
|  | [×] Access Module          |  |
|  |   [×] View Own Reports     |  |
|  |   [×] View Team Reports    |  |
|  |   [ ] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | User Management            |  |
|  | [×] Access Module          |  |
|  |   [×] View Users           |  |
|  |   [×] Create Users         |  |
|  |   [×] Edit Users           |  |
|  |   [×] Delete Users         |  |
|  |   [×] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Role Management            |  |
|  | [×] Access Module          |  |
|  |   [×] View Roles           |  |
|  |   [×] Create Roles         |  |
|  |   [×] Edit Roles           |  |
|  |   [×] Delete Roles         |  |
|  |   [×] View Cost Reports    |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Module Panel]       |  |
|  | Cost Management            |  |
|  | [×] Access Module          |  |
|  |   [×] View Costs           |  |
|  |   [×] Manage Role Costs    |  |
|  |   [×] Manage User Costs    |  |
|  +----------------------------+  |
|                                  |
|  [Save] [Cancel]                 |
+----------------------------------+
```

#### 6.5.4 Role Permission Features
- **Module-Based Access Control**:
  * Top-level module access toggles
  * Nested permission granularity within each module
  * Clear visual hierarchy of permissions
  * Automatic dependency checks (e.g., can't edit without view access)

- **Glassmorphism Permission Elements**:
  * Gradient highlights for enabled permissions
  * Subtle opacity reduction for disabled permissions
  * Visual feedback on hover (permission description tooltips)
  * Animation effects when toggling permissions

- **Permission Management Logic**:
  * Parent permissions enable/disable child permissions
  * Critical system permissions protected from accidental removal
  * Permission conflict prevention
  * Visual indicators for recommended permission sets by role type

- **Permission Templates**:
  * Quick-selection for common role types
  * Save custom permission sets as templates
  * Clone permissions from existing roles

### 6.6 User-Role Assignment

#### 6.6.1 Assign Roles to User
```
+----------------------------------+
|  [Glass Header]                  |
|  User: John Smith                |
|----------------------------------|
|                                  |
|  [Glass Tabs]                    |
|  Details | Cost | Roles | Projects|
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Role Panel]         |  |
|  | Assigned Roles             |  |
|  |                            |  |
|  | Primary Role:              |  |
|  | [Project Manager      ▼]   |  |
|  |                            |  |
|  | Additional Roles:          |  |
|  | [×] Developer              |  |
|  | [ ] Quality Assurance      |  |
|  | [ ] Business Analyst       |  |
|  | [ ] Scrum Master           |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Save] [Cancel]                 |
+----------------------------------+
```

- **Permission Inheritance**:
  * Users inherit all permissions from assigned roles
  * Primary role determines default view and dashboard presentation
  * Multiple roles combine permissions (most permissive wins)
  * Role-based menu visibility and feature access
  * Visual indicators in UI for permission source (which role grants access)

## 7. Reporting

TrackrEdge provides comprehensive reporting capabilities organized into three main categories: Time Reports, Plan/Variance Reports, and Performance Reports. All reports feature our signature glassmorphism design language and powerful filtering options.

### 7.1 Time Reports

#### 7.1.1 Time Summary by Member
```
+----------------------------------+
|  [Glass Header]                  |
|  Time Summary by Member          |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Project: [Glass Dropdown]       |
|  Client: [Glass Dropdown]        |
|  Show: [Hours ▼]                 |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Multi-colored Bar Chart   |  |
|  |  with Glass-effect Tooltips]  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  | Member | Total | Billable  |  |
|  |--------|-------|------------| |
|  | John   | 45.0  | 36.0      |  |
|  | Sarah  | 30.0  | 27.5      |  |
|  |--------|-------|------------| |
|  | Total  | 75.0  | 63.5      |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.1.2 Time Summary by Project
```
+----------------------------------+
|  [Glass Header]                  |
|  Time Summary by Project         |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Client: [Glass Dropdown]        |
|  Member: [Glass Dropdown]        |
|  Show: [Hours ▼]                 |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Multi-colored Pie Chart   |  |
|  |  with Glass-effect Tooltips]  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  | Project | Hours | % of Total |
|  |---------|-------|------------| |
|  | Alpha   | 45.0  | 60%       |  |
|  | Beta    | 30.0  | 40%       |  |
|  |---------|-------|------------| |
|  | Total   | 75.0  | 100%      |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.1.3 Time Summary by Client
```
+----------------------------------+
|  [Glass Header]                  |
|  Time Summary by Client          |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Member: [Glass Dropdown]        |
|  Project: [Glass Dropdown]       |
|  Show: [Hours ▼]                 |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Multi-colored Donut Chart |  |
|  |  with Glass-effect Tooltips]  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  | Client | Billable | Non-Bill |
|  |--------|-----------|--------| |
|  | ABC Inc| 42.5      | 5.0    |  |
|  | XYZ Co | 21.0      | 6.5    |  |
|  |--------|-----------|--------| |
|  | Total  | 63.5      | 11.5   |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.1.4 Timesheet Approval Summary
```
+----------------------------------+
|  [Glass Header]                  |
|  Timesheet Approval Summary      |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Status: [Glass Multi-select]    |
|  Approver: [Glass Dropdown]      |
|                                  |
|  +----------------------------+  |
|  | [Glass Status Summary]     |  |
|  | Submitted: 12              |  |
|  | Approved: 8                |  |
|  | Rejected: 2                |  |
|  | Open: 4                    |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  | Member | Status | Submitted |  |
|  |--------|---------|----------| |
|  | John   | Approved | May 1   |  |
|  | Sarah  | Rejected | May 2   |  |
|  | Mike   | Open     | -       |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

### 7.2 Plan/Variance Reports

#### 7.2.1 Project Hours Variance
```
+----------------------------------+
|  [Glass Header]                  |
|  Project Hours Variance          |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Project: [Glass Dropdown]       |
|  Period: [Glass Date Range]      |
|  Group By: [Glass Segmented]     |
|  Member | Phase | Task           |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Stacked Bar Chart with    |  |
|  |  Plan vs Actual Hours]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  | Group | Plan | Actual | Var% |
|  |-------|------|--------|-----| |
|  | Dev   | 80.0 | 92.5   | +16% |  |
|  | QA    | 40.0 | 35.0   | -13% |  |
|  |-------|------|--------|-----| |
|  | Total |120.0 |127.5   | +6%  |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.2.2 Project Completion Status
```
+----------------------------------+
|  [Glass Header]                  |
|  Project Completion Status       |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Client: [Glass Dropdown]        |
|  Status: [Glass Multi-select]    |
|  Sort By: [% Complete ▼]         |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Horizontal Progress Bars  |  |
|  |  with Glass-effect Tooltips]  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  |Project|Start|End |Complete|   |
|  |-------|-----|-----|-------| |
|  |Alpha  |Jan 1|Jun 1| 75%   |  |
|  |Beta   |Mar 1|Aug 1| 40%   |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.2.3 Hours Plan vs Actual by Resource
```
+----------------------------------+
|  [Glass Header]                  |
|  Hours Plan vs Actual by Resource|
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Project: [Glass Dropdown]       |
|  Member: [Glass Dropdown]        |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Side-by-side Bar Chart    |  |
|  |  with Plan vs Actual Hours]|  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  |Member|Plan|Actual|Var|Var% |  |
|  |------|----|----|-----|----| |
|  |John  |160 |172 | +12 | +8% |  |
|  |Sarah |160 |148 | -12 | -8% |  |
|  |------|----|----|-----|----| |
|  |Total |320 |320 |  0  | 0%  |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

### 7.3 Performance Reports

#### 7.3.1 Resource Utilization
```
+----------------------------------+
|  [Glass Header]                  |
|  Resource Utilization            |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Department: [Glass Dropdown]    |
|  Role: [Glass Dropdown]          |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Heat Map Chart showing    |  |
|  |  utilization percentages]  |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  |Member|Bill%|Avail|Target%|  |
|  |------|-----|-----|-------| |
|  |John  | 85% | 95% | 80%   |  |
|  |Sarah | 72% | 90% | 80%   |  |
|  |Mike  | 64% | 85% | 70%   |  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.3.2 Project Cost Analysis
```
+----------------------------------+
|  [Glass Header]                  |
|  Project Cost Analysis           |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Project: [Glass Dropdown]       |
|  Period: [Glass Date Range]      |
|  Group By: [Role ▼]              |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Cost Distribution Pie     |  |
|  |  Chart with Glass Effect]  |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  |Role  |Hours|Rate |Cost |% |  |
|  |------|-----|-----|-----|-| |
|  |Dev   |120  |$50  |$6000|60%|  |
|  |QA    |80   |$45  |$3600|36%|  |
|  |PM    |10   |$60  |$600 |6% |  |
|  |------|-----|-----|-----|-| |
|  |Total |210  |$48.6|$10200|100%|  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

#### 7.3.3 Client Profitability Analysis
```
+----------------------------------+
|  [Glass Header]                  |
|  Client Profitability Analysis   |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Period: [Glass Date Range]      |
|  Client: [Glass Dropdown]        |
|  Project: [Glass Dropdown]       |
|                                  |
|  +----------------------------+  |
|  | [Gradient Chart Card]      |  |
|  | [Stacked Bar Chart showing |  |
|  |  revenue vs cost bars]     |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Data Table]         |  |
|  |Client|Revenue|Cost|Margin|%|  |
|  |------|-------|----|----|--| |
|  |ABC   |$15,000|$9,000|$6,000|40%|  |
|  |XYZ   |$12,000|$8,400|$3,600|30%|  |
|  |------|-------|----|----|--| |
|  |Total |$27,000|$17,400|$9,600|36%|  |
|  +----------------------------+  |
|                                  |
|  [Glass Export Button Menu]      |
|  [PDF] [Excel] [CSV] [Print]     |
+----------------------------------+
```

### 7.4 Export Options Interface

TrackrEdge provides comprehensive export capabilities throughout the application with consistent glassmorphism styling:

#### 7.4.1 Export Menu Button
```
+----------------------------------+
|  [Glass Export Button]           |
|  Export ▼                        |
|  +----------------------------+  |
|  | [Glass Export Menu]        |  |
|  | PDF Document               |  |
|  | Excel Spreadsheet          |  |
|  | CSV File                   |  |
|  | Print View                 |  |
|  +----------------------------+  |
+----------------------------------+
```

#### 7.4.2 Exportable Areas
- **Reports**: All reports include export options (PDF, Excel, CSV, Print)
- **Timesheets**: Weekly, monthly, and list views exportable
- **Projects**: Project details and task lists
- **Clients**: Client summaries and project lists
- **Users**: User lists and role assignments (admin only)

#### 7.4.3 Export Setting Modal
```
+----------------------------------+
|  [Glass Header]                  |
|  Export Settings                 |
|----------------------------------|
|                                  |
|  Format: [PDF          ▼]        |
|                                  |
|  Options:                        |
|  [×] Include charts and graphs   |
|  [×] Include summary data        |
|  [ ] Include detailed records    |
|  [ ] Password protect document   |
|  [                            ]  |
|                                  |
|  [Export Now] [Cancel]           |
+----------------------------------+
```

#### 7.4.4 Glassmorphism Export Elements
- **Export Buttons**: Glass effect with gradient hover states
- **Format Icons**: Subtle format-specific glowing icons
- **Export Progress**: Animated glass loading indicator during export
- **Success Confirmation**: Brief glass toast notification when export completes

### 7.5 Advanced Reporting Features

#### 7.5.1 Report Builder
```
+----------------------------------+
|  [Glass Header]                  |
|  Advanced Report Builder         |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  +----------------------------+  |
|  | Data Source:               |  |
|  | [Timesheet Data       ▼]   |  |
|  |                            |  |
|  | Columns:                   |  |
|  | [×] User                   |  |
|  | [×] Project                |  |
|  | [×] Client                 |  |
|  | [×] Task                   |  |
|  | [×] Date                   |  |
|  | [×] Hours                  |  |
|  | [×] Cost                   |  |
|  | [ ] Notes                  |  |
|  |                            |  |
|  | Filters:                   |  |
|  | + Add Filter               |  |
|  |                            |  |
|  | Group By:                  |  |
|  | [Client           ▼]       |  |
|  | [Project          ▼]       |  |
|  |                            |  |
|  | Sort By:                   |  |
|  | [Date             ▼][DESC▼]|  |
|  |                            |  |
|  | Date Range:                |  |
|  | [Custom Date Range    ▼]   |  |
|  | [04/01/2024 - 04/30/2024]  |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Generate Report]               |
|                                  |
|  +----------------------------+  |
|  | [Glass Report Preview]     |  |
|  | [Data Grid with Results]   |  |
|  |                            |  |
|  | [Glass Export Panel]       |  |
|  | [Save] [Schedule] [Share]  |  |
|  | [PDF] [Excel] [CSV] [Print]|  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### 7.5.2 Saved Reports
```
+----------------------------------+
|  [Glass Header]                  |
|  Saved Reports                   |
|----------------------------------|
|                                  |
|  [Glass Filter Bar]              |
|  Filter: [            ] Type: [All ▼]
|  + New Report                    |
|                                  |
|  +----------------------------+  |
|  | [Glass Report Card]        |  |
|  | Monthly Client Summary     |  |
|  | Type: Time Summary         |  |
|  | Created: 04/15/2024        |  |
|  | Last Run: 05/01/2024       |  |
|  | [Run] [Edit] [Delete]      |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Report Card]        |  |
|  | Project X Progress         |  |
|  | Type: Project Detail       |  |
|  | Created: 04/10/2024        |  |
|  | Last Run: 04/30/2024       |  |
|  | [Run] [Edit] [Delete]      |  |
|  +----------------------------+  |
|                                  |
|  [Glass Pagination]              |
+----------------------------------+
```

#### 7.5.3 Report Scheduling
```
+----------------------------------+
|  [Glass Header]                  |
|  Schedule Report                 |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Form Panel]         |  |
|  | Report: Monthly Client Summary|
|  |                            |  |
|  | Schedule:                  |  |
|  | (•) Monthly                |  |
|  | ( ) Weekly                 |  |
|  | ( ) Daily                  |  |
|  |                            |  |
|  | Run on:                    |  |
|  | [1st        ▼] of each month |
|  |                            |  |
|  | Delivery Method:           |  |
|  | [×] Email                  |  |
|  | [ ] Save to System         |  |
|  |                            |  |
|  | Recipients:                |  |
|  | [user1@example.com       ] |  |
|  | [user2@example.com       ] |  |
|  | + Add Recipient             |  |
|  |                            |  |
|  | Format:                    |  |
|  | (•) PDF                    |  |
|  | ( ) Excel                  |  |
|  | ( ) CSV                    |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  [Save Schedule] [Cancel]        |
+----------------------------------+
```

## 8. Notification System

### 8.1 Notification Center
```
+----------------------------------+
|  [Glass Top Header]              |
|  [Logo]        [Search] [0:00] [3] [User]
|                          [Bell]  |
|----------------------------------|
```

#### 8.1.1 Notification Dropdown
```
+----------------------------------+
|  [Glass Top Header]              |
|  [Logo]        [Search] [0:00] [3] [User]
|                          [Bell]  |
|  +----------------------------+  |
|  | [Glass Notification Panel] |  |
|  | Notifications              |  |
|  |                            |  |
|  | [Glass Notification Card]  |  |
|  | Timesheet Approved         |  |
|  | Your timesheet for Apr 24- |  |
|  | Apr 30 has been approved   |  |
|  | 5 minutes ago              |  |
|  |                            |  |
|  | [Glass Notification Card]  |  |
|  | New Task Assigned          |  |
|  | You've been assigned to    |  |
|  | "Update documentation"     |  |
|  | 2 hours ago                |  |
|  |                            |  |
|  | [Glass Notification Card]  |  |
|  | Timesheet Reminder         |  |
|  | Reminder to submit your    |  |
|  | timesheet for this week    |  |
|  | 1 day ago                  |  |
|  |                            |  |
|  | [View All Notifications]   |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

#### 8.1.2 Full Notification Page
```
+----------------------------------+
|  [Glass Header]                  |
|  Notifications                   |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  Filter: [All Types       ▼]     |
|  Show:   [All            ▼]      |
|  Period: [Last 30 days   ▼]      |
|                                  |
|  +----------------------------+  |
|  | [Glass Date Divider]       |  |
|  | Today                      |  |
|  | [Glass Notification Card]  |  |
|  | Timesheet Approved         |  |
|  | Your timesheet for Apr 24- |  |
|  | Apr 30 has been approved   |  |
|  | 5 minutes ago              |  |
|  | [View Timesheet]           |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Date Divider]       |  |
|  | Yesterday                  |  |
|  | [Glass Notification Card]  |  |
|  | New Task Assigned          |  |
|  | You've been assigned to    |  |
|  | "Update documentation"     |  |
|  | 2 hours ago                |  |
|  | [View Task]                |  |
|  +----------------------------+  |
|                                  |
|  [Glass Pagination]              |
+----------------------------------+
```

### 8.2 Notification Types and Styling

#### 8.2.1 Priority-Based Styling
- **High Priority**: Red gradient glow around notification card
- **Medium Priority**: Orange gradient glow around notification card
- **Low Priority**: Blue gradient glow around notification card
- **Informational**: Default glass styling with subtle glow

#### 8.2.2 Notification Categories
- **Timesheet**: Submissions, approvals, rejections, reminders
- **Project**: Assignments, deadline changes, status updates
- **Task**: New assignments, status changes, comments
- **User**: Account updates, role changes, access changes
- **System**: Maintenance alerts, feature updates, announcements

### 8.3 Email Templates

#### 8.3.1 Email Notification Design
```
+----------------------------------+
|  [TrackrEdge Logo & Header]      |
|  [Gradient Border]               |
|----------------------------------|
|                                  |
|  [Glass Panel]                   |
|  Hello {User.FirstName},         |
|                                  |
|  {Notification.Title}            |
|                                  |
|  {Notification.Message}          |
|                                  |
|  [Glass Action Button]           |
|  {Notification.ActionText}       |
|                                  |
|  [Footer with Subtle Gradient]   |
|  © 2024 TrackrEdge               |
|  [Unsubscribe] [Preferences]     |
+----------------------------------+
```

#### 8.3.2 Email Template Examples

##### Timesheet Approval Template
```
+----------------------------------+
|  [TrackrEdge Logo & Header]      |
|  [Gradient Border]               |
|----------------------------------|
|                                  |
|  [Glass Panel]                   |
|  Hello John,                     |
|                                  |
|  Timesheet Approved              |
|                                  |
|  Your timesheet for the period   |
|  April 24-30, 2024 has been      |
|  approved by Jane Smith.         |
|                                  |
|  Total Hours: 40.0               |
|  Billable Hours: 32.5            |
|  Non-Billable Hours: 7.5         |
|                                  |
|  [Glass Action Button]           |
|  View Timesheet                  |
|                                  |
|  [Footer with Subtle Gradient]   |
|  © 2024 TrackrEdge               |
|  [Unsubscribe] [Preferences]     |
+----------------------------------+
```

##### Timesheet Reminder Template
```
+----------------------------------+
|  [TrackrEdge Logo & Header]      |
|  [Gradient Border]               |
|----------------------------------|
|                                  |
|  [Glass Panel]                   |
|  Hello John,                     |
|                                  |
|  Timesheet Reminder              |
|                                  |
|  This is a friendly reminder to  |
|  submit your timesheet for the   |
|  period May 1-7, 2024.           |
|                                  |
|  Submission Deadline: May 8, 2024|
|  Current Status: Not Submitted   |
|  Hours Logged So Far: 16.5       |
|                                  |
|  [Glass Action Button]           |
|  Complete Timesheet              |
|                                  |
|  [Footer with Subtle Gradient]   |
|  © 2024 TrackrEdge               |
|  [Unsubscribe] [Preferences]     |
+----------------------------------+
```

### 8.4 Notification Settings
```
+----------------------------------+
|  [Glass Header]                  |
|  Notification Settings           |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Setting Panel]      |  |
|  | In-App Notifications       |  |
|  |                            |  |
|  | [Glass Toggle Group]       |  |
|  | Timesheet Reminders   [ON] |  |
|  | Timesheet Approvals   [ON] |  |
|  | Timesheet Rejections  [ON] |  |
|  | New Task Assignments  [ON] |  |
|  | Project Updates       [ON] |  |
|  | System Announcements  [ON] |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | [Glass Setting Panel]      |  |
|  | Email Notifications        |  |
|  |                            |  |
|  | [Glass Toggle Group]       |  |
|  | Timesheet Reminders   [ON] |  |
|  | Timesheet Approvals   [ON] |  |
|  | Timesheet Rejections  [ON] |  |
|  | New Task Assignments  [OFF]|  |
|  | Project Updates       [OFF]|  |
|  | System Announcements  [ON] |  |
|  +----------------------------+  |
|                                  |
|  [Save Settings] [Reset Defaults]|
+----------------------------------+
```

## 9. Audit Logging

### 9.1 Audit Log Interface
```
+----------------------------------+
|  [Glass Header]                  |
|  Audit Log                       |
|----------------------------------|
|                                  |
|  [Glass Filter Panel]            |
|  User: [All Users        ▼]      |
|  Action: [All Actions    ▼]      |
|  Module: [All Modules    ▼]      |
|  Date: [Last 7 Days      ▼]      |
|  [Apply Filters]                 |
|                                  |
|  +----------------------------+  |
|  | [Glass Audit Table]        |  |
|  | Timestamp | User | Action  |  |
|  |-----------|------|----------| |
|  | 05/12/24  | John | Timesheet|  |
|  | 14:30:25  | Smith| Approved |  |
|  |-----------|------|----------| |
|  | 05/12/24  | Jane | User Role|  |
|  | 13:15:10  | Doe  | Changed  |  |
|  |-----------|------|----------| |
|  | 05/12/24  | Admin| Project  |  |
|  | 11:45:22  | User | Created  |  |
|  +----------------------------+  |
|                                  |
|  [Glass Pagination]              |
|  [Glass Export Button: CSV]      |
+----------------------------------+
```

### 9.2 Audit Log Entry Detail
```
+----------------------------------+
|  [Glass Header]                  |
|  Audit Log Entry                 |
|----------------------------------|
|                                  |
|  +----------------------------+  |
|  | [Glass Detail Panel]       |  |
|  | Timestamp: 05/12/2024 14:30:25|
|  | User: John Smith           |  |
|  | IP Address: 192.168.1.105  |  |
|  | Module: Timesheet          |  |
|  | Action: Approved           |  |
|  | Target: Timesheet #12345   |  |
|  | Details:                   |  |
|  | Approved timesheet for Jane|  |
|  | Doe for period 05/01/2024 -|  |
|  | 05/07/2024                 |  |
|  |                            |  |
|  | [Glass Changes Panel]      |  |
|  | Before:                    |  |
|  | Status: Submitted          |  |
|  | After:                     |  |
|  | Status: Approved           |  |
|  | Comment: "Good work!"      |  |
|  +----------------------------+  |
|                                  |
|  [Back to Audit Log]             |
+----------------------------------+
```

### 9.3 Audit Log Features

#### 9.3.1 Tracked Activities
- **User Management**: User creation, role changes, permission updates
- **Timesheet**: Submissions, approvals, rejections, modifications
- **Project**: Creation, updates, team assignment changes
- **Client/Product**: Creation, updates, relation changes
- **System**: Configuration changes, login/logout events

#### 9.3.2 Audit Record Details
- Timestamp (with timezone)
- User (name and ID)
- IP Address
- Browser/Device information
- Module and specific action
- Target entity (what was affected)
- Before/After states (what changed)
- Related entities (contextual information)

#### 9.3.3 Glassmorphism Audit Features
- **Contextual Colorization**: Different action types have subtle gradient tinting
- **Interactive Timeline**: Glass timeline showing frequency of audit events
- **Expandable Entries**: Card expansion with animation for details
- **Activity Heatmap**: Glass-styled visualization of activity patterns

## 10. Responsive Design Considerations

### 10.1 Mobile Adaptations
- Glass cards stack vertically instead of grid layout
- Simplified glassmorphism effects to maintain performance
- Collapsible glass side menu
- Touch-friendly interactive elements with increased hit areas
- Condensed glass headers that minimize on scroll

### 10.2 Tablet Adaptations  
- Two-column grid of glass cards  
- Side panels collapse to icons with glass tooltip labels
- Optimized glass effects for mid-size screens
- Hybrid navigation system with both bottom and side options

## 11. Accessibility Considerations

### 11.1 Glassmorphism Accessibility
- Sufficient contrast ratios despite transparency
- Focus states with prominent indicators
- Alternative non-glass view for users with visual impairments
- Reduced motion option for animations
- Text size adjustments that maintain glass card proportions

## Modern & Innovative Admin Panel Requirement
- The UI/UX must be modern, visually appealing, and innovative.
- Focus on custom layouts, beautiful data visualizations, and a delightful user experience.
- Use advanced charts, smooth transitions, and custom branding.

## 12. Role Cost Management

### 12.1 Role Cost Settings
```
+----------------------------------+
|  Role Cost Management            |
|----------------------------------|
|                                  |
|  Select Role: [Dropdown ▼]       |
|                                  |
|  +----------------------------+  |
|  | [Frosted Glass Panel]      |  |
|  | Role: Senior Developer     |  |
|  |                            |  |
|  | Hourly Rate: [$20.00     ] |  |
|  | Daily Rate:  [$160.00    ] |  |
|  | Standard Hours: [8       ] |  |
|  | Effective From: [Date    ] |  |
|  |                            |  |
|  | [Save] [Cancel]            |  |
|  +----------------------------+  |
|                                  |
|  [History Panel]                 |
|  +----------------------------+  |
|  | Rate History               |  |
|  | Date       | Hour | Day    |  |
|  | 2024-03-01 | $18  | $144   |  |
|  | 2024-01-01 | $15  | $120   |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

### 12.2 Role Cost Reports
```
+----------------------------------+
|  Cost Reports                    |
|----------------------------------|
|                                  |
|  Report Type:                    |
|  [Project Costs ▼]               |
|                                  |
|  Filters:                        |
|  Date Range: [Dates           ]  |
|  Group By:   [Role ▼]            |
|                                  |
|  [Generate Report]               |
|                                  |
|  +----------------------------+  |
|  | [Glass Panel Chart]        |  |
|  | Role Cost Distribution     |  |
|  | [Gradient Pie Chart]       |  |
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  | Breakdown                  |  |
|  | Role  | Hours | Cost | %   |  |
|  | Dev   | 120   | $2400| 60% |  |
|  | QA    | 80    | $1600| 40% |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

### 12.3 Timesheet With Costs
```