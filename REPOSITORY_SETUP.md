# Repository Setup & Submission Guide

## 📋 Repository Naming Format

Your GitHub repository must follow this EXACT format:

```
Flutter Bonus Assignment - Abdul Shahariar Shafin - 2220744 - Section [Your Section Number]
```

**Example:**
- `Flutter Bonus Assignment - Abdul Shahariar Shafin - 2220744 - Section 1`
- `Flutter Bonus Assignment - Abdul Shahariar Shafin - 2220744 - Section 2`

Replace `[Your Section Number]` with your actual section.

## 🚀 Steps to Create Repository

### 1. Create New Repository on GitHub

1. Go to [GitHub](https://github.com)
2. Click **"+"** (top right) → **"New repository"**
3. **Repository name**: `Flutter Bonus Assignment - Abdul Shahariar Shafin - 2220744 - Section X`
4. **Description** (optional): "Firebase Firestore Task Management App"
5. Choose **Public** (so instructors can access)
6. Click **"Create repository"**

### 2. Initialize Git in Your Local Project

```bash
cd c:\Users\User\Downloads\New folder\assignment_two_flutter_ui_abdul_shahariar_shafin_2220744
git init
git add .
git commit -m "Initial commit: Firebase Firestore integration"
```

### 3. Add Remote and Push

```bash
git remote add origin https://github.com/YOUR_USERNAME/Flutter-Bonus-Assignment-Abdul-Shahariar-Shafin-2220744-Section-X.git
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

## ✅ Before Pushing to GitHub

Make sure these files are configured:

- [ ] `lib/firebase_options.dart` - Updated with your Firebase credentials
- [ ] `android/app/google-services.json` - Placed in correct location (if Android)
- [ ] `.gitignore` - Should exclude Firebase configs and credentials

### Recommended .gitignore entries:

```
firebase_options.dart
google-services.json
GoogleService-Info.plist
*.lock
build/
.dart_tool/
.flutter-plugins
```

## 📹 Recording Demo Video

Your video should demonstrate:

### Part 1: App Launch (10 seconds)
- App opens successfully
- Firebase initializes without errors
- Tasks page loads

### Part 2: Add Task (30 seconds)
- Click "+" button
- Enter task title
- Enter task description
- Click "Add Task"
- Task appears in the list
- Show success message

### Part 3: Real-time Updates (20 seconds)
- Add another task
- Show it appears immediately
- Optionally open Firestore console showing database updates

### Part 4: Delete Task (20 seconds)
- Click delete icon on a task
- Confirm deletion
- Task disappears from list
- Show success message

### Part 5: Firestore Verification (20 seconds) - Optional
- Open Firebase Console
- Show Firestore database
- Show tasks collection with documents
- Verify all data is there

**Total video length: 1-2 minutes**

## 📝 Video Recording Tips

- Use screen recording tool:
  - **Android**: Built-in or use external tool
  - **iOS**: Control Center → Screen Recording
  - **Emulator**: Android Studio or VS Code has built-in recording

- Keep audio clear (optional narration helps)
- Show slow motion for clarity
- Ensure good lighting if showing physical device

## 🎬 Upload Video

1. Upload to Google Drive, YouTube (unlisted), or OneDrive
2. Get shareable link
3. Add to Google Classroom submission

## 📤 Submission Checklist

Before submitting to Google Classroom:

- [ ] GitHub repository created with correct naming format
- [ ] All code pushed to GitHub (main branch)
- [ ] `firebase_options.dart` updated with credentials
- [ ] App builds and runs without errors
- [ ] All CRUD features working:
  - [ ] Add task works
  - [ ] Tasks display in real-time
  - [ ] Delete task works
  - [ ] Firestore integration verified
- [ ] Video recorded (1-2 minutes)
- [ ] Video uploaded to accessible platform
- [ ] Google Classroom submission includes:
  - [ ] GitHub repository link
  - [ ] Video link
  - [ ] Brief description of what was implemented

## 📋 Submission Information

**What to submit in Google Classroom:**

```
GitHub Repository:
https://github.com/YOUR_USERNAME/Flutter-Bonus-Assignment-Abdul-Shahariar-Shafin-2220744-Section-X

Video Demonstration:
[Link to your video]

Features Implemented:
✅ Firebase setup and configuration
✅ Firestore database integration
✅ Task model with CRUD operations
✅ Repository pattern for data layer
✅ Real-time task updates using StreamBuilder
✅ Add task functionality
✅ Delete task functionality
✅ Clean and responsive UI
```

## 🔐 Security Notes

⚠️ **Important:**
- Never commit `firebase_options.dart` if it contains real credentials (except for private repos)
- Add sensitive files to `.gitignore`
- Don't share API keys publicly
- For production, implement proper authentication

## ❓ Troubleshooting Submission

| Issue | Solution |
|-------|----------|
| Repository not found | Check URL is correct and repo is public |
| Video won't play | Use common format (MP4, AVI) and check link |
| Can't find GitHub link | Go to repo → Click green Code button → Copy HTTPS |
| App crashes in video | Ensure Firebase is properly configured |

## 📞 Support

If you encounter issues:

1. Check [SETUP_GUIDE.md](SETUP_GUIDE.md) for Firebase setup
2. Check [IMPLEMENTATION_DETAILS.md](IMPLEMENTATION_DETAILS.md) for code structure
3. Check [QUICK_REFERENCE.md](QUICK_REFERENCE.md) for quick solutions

## ✨ Final Checklist

- [ ] Firebase project created and configured
- [ ] Flutter app code updated with Firebase integration
- [ ] All features tested and working
- [ ] GitHub repository created with correct naming
- [ ] Code pushed to GitHub
- [ ] Demo video recorded
- [ ] Video link prepared
- [ ] Google Classroom submission ready

---

**You're all set!** 🎉

Once you've completed these steps, your assignment is ready for submission.
