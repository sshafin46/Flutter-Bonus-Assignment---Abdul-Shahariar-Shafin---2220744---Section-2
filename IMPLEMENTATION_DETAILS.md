# Implementation Details

## Architecture Overview

This project follows the **Repository Pattern** for clean separation between UI and data layers.

```
┌─────────────────────────────────────────────┐
│           UI Layer (Page2)                   │
│  (StreamBuilder, Dialog, ListTile widgets)  │
└─────────────────────────────────────────────┘
                      ↓
         ┌──────────────────────────┐
         │   TaskRepository         │
         │ (Firebase operations)    │
         └──────────────────────────┘
                      ↓
         ┌──────────────────────────┐
         │   Firestore Database     │
         │   (Cloud Backend)        │
         └──────────────────────────┘
```

## Code Components

### 1. Task Model (`lib/models/task_model.dart`)

```dart
class Task {
  final String id;           // Unique document ID
  final String title;        // Task title
  final String description;  // Task details
  final DateTime createdAt;  // Creation timestamp
}
```

**Key Methods:**
- `toJson()`: Converts Task to Firestore-compatible map
- `fromJson()`: Creates Task from JSON data
- `fromFirestore()`: Creates Task directly from Firestore document

### 2. Task Repository (`lib/repositories/task_repository.dart`)

**Methods:**

#### `addTask(Task task)` 
- Adds a new task to Firestore `tasks` collection
- Returns document ID
- Throws exception on failure

#### `deleteTask(String taskId)`
- Removes task from Firestore by ID
- Handles errors gracefully

#### `updateTask(String taskId, Map<String, dynamic> updates)`
- Updates specific fields of a task
- Partial updates supported

#### `getTasks()` (Stream)
- Real-time stream of all tasks
- Ordered by creation date (newest first)
- Automatically updates when database changes

#### `getTask(String taskId)` (Future)
- Fetches single task by ID
- Returns null if not found

### 3. User Interface (`lib/pages/page2.dart`)

**Widgets:**
- `StreamBuilder`: Listens to real-time task updates
- `AlertDialog`: Form for adding new tasks
- `ListTile`: Displays individual tasks
- `FloatingActionButton`: Quick access to add task

**Key Features:**
- Empty state with helpful message
- Loading indicator while fetching data
- Error handling with user feedback
- Delete confirmation dialog
- Input validation (title required)

### 4. Firebase Configuration (`lib/firebase_options.dart`)

Platform-specific Firebase configuration:
- Android (with google-services.json)
- iOS (with GoogleService-Info.plist)
- Web, Linux, macOS, Windows

## Data Flow

### Adding a Task

```
User clicks "+" button
         ↓
Dialog opens with title & description fields
         ↓
User enters details and clicks "Add Task"
         ↓
Task object created with current timestamp
         ↓
TaskRepository.addTask() called
         ↓
Firestore receives data and creates document
         ↓
StreamBuilder receives update
         ↓
UI rebuilds with new task in list
         ↓
Success message shown
```

### Deleting a Task

```
User taps delete icon
         ↓
Confirmation dialog shown
         ↓
User confirms deletion
         ↓
TaskRepository.deleteTask(taskId) called
         ↓
Firestore removes document
         ↓
StreamBuilder receives update (task removed)
         ↓
UI rebuilds without deleted task
         ↓
Success message shown
```

### Real-time Display

```
StreamBuilder listening to tasks collection
         ↓
Database change detected
         ↓
Snapshot received with updated list
         ↓
Task list mapped to Task objects
         ↓
UI rebuilds immediately with new data
         ↓
User sees changes in real-time
```

## Firestore Database Structure

```
Firestore Console:
├── Database: (default)
│   └── Collection: tasks
│       ├── Document: auto-generated-id-1
│       │   ├── id: "timestamp-string"
│       │   ├── title: "Complete Assignment"
│       │   ├── description: "Finish Firebase integration"
│       │   └── createdAt: 2024-04-16T10:30:00.000Z
│       │
│       ├── Document: auto-generated-id-2
│       │   ├── id: "timestamp-string"
│       │   ├── title: "Review Code"
│       │   ├── description: "Check for best practices"
│       │   └── createdAt: 2024-04-16T10:25:00.000Z
```

## Dependencies

```yaml
firebase_core: ^3.8.0        # Firebase initialization
cloud_firestore: ^5.5.0      # Cloud Firestore database
intl: ^0.20.0                # Internationalization & date formatting
```

## Error Handling

The repository implements try-catch blocks for all Firebase operations:

```dart
try {
  // Firebase operation
} catch (e) {
  throw Exception('Operation failed: $e');
}
```

UI layer shows errors in SnackBars for user feedback.

## StreamBuilder Pattern

```dart
StreamBuilder<List<Task>>(
  stream: _taskRepository.getTasks(),
  builder: (context, snapshot) {
    // Handle connection states
    if (snapshot.connectionState == ConnectionState.waiting)
      // Show loading
    
    // Handle errors
    if (snapshot.hasError)
      // Show error UI
    
    // Handle data
    final tasks = snapshot.data ?? [];
    // Build task list UI
  },
)
```

## Security Rules

Current rules (Test Mode):
```firestore
allow read, write: if true;
```

**For Production, use:**
```firestore
allow read, write: if request.auth != null;
```

This requires user authentication.

## Best Practices Implemented

✅ Repository pattern for separation of concerns  
✅ Stream-based real-time updates  
✅ Error handling and user feedback  
✅ Input validation  
✅ Null safety throughout  
✅ Proper resource disposal  
✅ Platform-specific Firebase setup  
✅ Firestore document structure  

## Common Modifications

### Change Firestore collection name:
```dart
final String _collectionName = 'tasks'; // Modify here
```

### Add more fields to Task:
```dart
class Task {
  // Add new field
  final bool isCompleted;
  
  // Update fromJson
  isCompleted: json['isCompleted'] ?? false,
  
  // Update toJson
  'isCompleted': isCompleted,
}
```

### Add sorting/filtering:
```dart
// In getTasks() stream
.where('isCompleted', isEqualTo: false)  // Filter
.orderBy('createdAt', descending: true)   // Sort
```

## Testing Checklist

- [ ] App runs without errors
- [ ] Firebase initializes successfully
- [ ] Can add task with title and description
- [ ] New task appears in list immediately
- [ ] Tasks display in correct order (newest first)
- [ ] Can delete task with confirmation
- [ ] Real-time updates work across devices (if tested on multiple)
- [ ] Error messages display correctly
- [ ] Empty state shows when no tasks exist
- [ ] Firestore security rules allow operations
