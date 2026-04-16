# Firebase Firestore Integration Setup Guide

## Overview
This guide walks you through setting up Firebase Firestore for your Flutter Task Management app.

## Step 1: Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click **"Create a project"**
3. Enter your project name: `Flutter Bonus Assignment - Abdul Shahariar Shafin - 2220744`
4. Click **"Continue"**
5. **Disable Google Analytics** (optional for this assignment)
6. Click **"Create project"**
7. Wait for the project to be created

## Step 2: Enable Firestore Database

1. In Firebase Console, click your project
2. In the left sidebar, click **"Build"** → **"Firestore Database"**
3. Click **"Create database"**
4. Select region (choose closest to your location)
5. Start in **"Test mode"** for development
6. Click **"Create"**

## Step 3: Update Firestore Security Rules

1. In Firestore Database, click the **"Rules"** tab
2. Replace the default rules with:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /tasks/{document=**} {
      allow read, write: if true;
    }
  }
}
```

3. Click **"Publish"**

> ⚠️ **Note**: These rules allow anyone to read/write. For production, implement proper authentication.

## Step 4: Get Firebase Credentials

### For Android:

1. In Firebase Console, go to **Project Settings** (gear icon)
2. Click **"Your apps"** section
3. Click the Android app (if not created, follow the setup wizard)
4. Download the `google-services.json` file
5. Place it in `android/app/` directory

### For iOS:

1. In Firebase Console, go to **Project Settings**
2. Click the iOS app
3. Download the `GoogleService-Info.plist` file
4. In Xcode, add it to the Runner project

### For Web:

1. In Firebase Console, go to **Project Settings**
2. Find your Web app configuration (JavaScript snippet)
3. You'll need the config object

## Step 5: Update firebase_options.dart

1. Open `lib/firebase_options.dart`
2. Replace the placeholder values with your actual Firebase credentials:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_ACTUAL_ANDROID_API_KEY',
  appId: 'YOUR_ACTUAL_ANDROID_APP_ID',
  messagingSenderId: 'YOUR_ACTUAL_MESSAGING_SENDER_ID',
  projectId: 'your-project-id',
  storageBucket: 'your-project-id.appspot.com',
);
```

Find these values in Firebase Console → Project Settings

## Step 6: Run the Flutter App

1. Open terminal in project root
2. Run: `flutter pub get`
3. Run: `flutter run`

The app should now:
- Initialize Firebase
- Connect to Firestore
- Allow you to add tasks
- Display tasks in real-time
- Support deleting tasks

## Features Implemented

✅ **Add Task** - Input title and description, add to Firestore  
✅ **Delete Task** - Remove tasks from Firestore  
✅ **Real-time Updates** - StreamBuilder listens to Firestore changes  
✅ **Task Model** - Complete Dart model with serialization  
✅ **Repository Pattern** - Clean separation of concerns  

## File Structure

```
lib/
├── main.dart                 # Firebase initialization
├── firebase_options.dart     # Firebase configuration (UPDATE THIS!)
├── models/
│   └── task_model.dart       # Task data model
├── repositories/
│   └── task_repository.dart  # Firebase CRUD operations
└── pages/
    └── page2.dart            # Task management UI
```

## Testing the App

1. **Add a task**: Click the "+" button or "Add Your First Task"
2. **Enter details**: Title and description
3. **View real-time updates**: New tasks appear instantly
4. **Delete a task**: Click the trash icon
5. **Verify Firestore**: Check your database in Firebase Console

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Firebase not initialized" | Update `firebase_options.dart` with real credentials |
| "Permission denied" | Check Firestore Rules (should allow read/write) |
| No tasks displaying | Ensure Firestore collection "tasks" has documents |
| Connection timeout | Verify internet connection and Firebase project is active |

## Next Steps for Submission

1. ✅ Set up Firebase project
2. ✅ Connect Flutter app to Firebase
3. ✅ Test CRUD operations
4. ✅ Create GitHub repository with correct naming format
5. ✅ Push code to GitHub
6. ✅ Record demo video showing:
   - Adding a new task
   - Task appearing in real-time
   - Deleting a task
   - Firestore integration working
7. ✅ Submit video to Google Classroom

## GitHub Repository Naming

Your repository should be named:
```
Flutter Bonus Assignment - Abdul Shahariar Shafin - 2220744 - Section [Your Section Number]
```

## Important Notes

- Keep your Firebase credentials secure
- Never commit `google-services.json` to public repositories (add to `.gitignore`)
- Test on actual device/emulator for best results
- For iOS, build may take longer on first run
