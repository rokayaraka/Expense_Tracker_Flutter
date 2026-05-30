# 💰 Expense Tracker 

A modern Flutter Expense Tracker application built using **Clean Architecture**, **SharedPreferences**, and **Material Design**.

The application helps users manage daily expenses, track spending habits, visualize expense statistics, and maintain a personal finance record with a beautiful and responsive user interface.

---

## 📱 Screenshots

<img width="1920" height="1080" alt="Expense Tracker App (3)" src="https://github.com/user-attachments/assets/62c240fb-a539-48e4-a7bd-8172896e3f70" />





---

## ✨ Features

### 🔐 Authentication
- Splash Screen
- Login Screen
- Signup Screen
- Logout Functionality
- Session Management

### 💵 Expense Management
- Add Expense
- Delete Expense
- View Expenses
- Expense Categories
- Date Selection
- Local Storage Persistence

### 📊 Analytics
- Expense Statistics
- Category-Based Chart
- Visual Spending Overview

### 🎨 UI Features
- Modern Material Design
- Responsive Layout
- Custom Expense Cards
- Animated Bottom Sheet
- Beautiful Dashboard

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles.

```text
lib/
├── application/
│   ├── services/
│        ├── auth_services/
├── core/
│   ├── constants/
│        ├── app_colors/
│        ├── app_strings/
│
├── features/ 
│   ├── data/
│       ├── local_data/
│       ├── models/
│            ├── expense_model/
│            ├── page_view_model/
│
│   ├── domain/
│       ├──expense_entity/
│       └──expense_repositories/
│       ├── expense_repo_impl/
│   └── presentation/
│       ├── controllers/
│            ├── expense_controller/
│       ├── screens/
│            ├── expense_HomeScreen/
│            ├── splash_screen/
│            ├── auth_screens/
│                ├── forget_password_screen/
│                ├── sign_In_screen/
│                ├── sign_Up_screen/
│       └── widgets/
│            ├── chart_bar/
│            ├── chart/
│            ├── expense_item/
│            ├── expense_list/
│            ├── new_expense/
│
└── main.dart
```

---

## 📂 Project Structure

### Core Layer
Contains:
- Constants

### Data Layer
Handles:
- SharedPreferences
- Expense Models
- Repository Implementations

### Domain Layer
Contains:
- Business Logic
- Entities
- Repository Contracts

### Presentation Layer
Contains:
- UI Screens
- Widgets
- Controllers

---

## 🚀 Technologies Used

### Frontend
- Flutter
- Dart

### Local Storage
- SharedPreferences

### State Management
- ChangeNotifier

### UI Components
- Material Design
- Custom Widgets

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  shared_preferences: ^2.2.2
  firebase_core: ^4.9.0
  firebase_auth: ^6.5.1
  page_transition: ^2.2.2
  google_sign_in: ^7.2.0
  fl_chart: ^1.2.0
  mediaquery_sizer: ^1.1.1
  google_fonts: ^8.1.0
```

---

## 📊 Expense Categories

The application currently supports:

- 🍔 Food
- 🎮 Leisure
- ✈️ Travel
- 💼 Work

---

## 🔥 Main Functionalities

### Add Expense

Users can:
- Enter title
- Enter amount
- Select date
- Select category

### Delete Expense

Users can:
- Swipe to delete
- Undo deletion using Snackbar

### Save Data

All expenses are stored locally using:

```dart
SharedPreferences
```

No internet connection required.

---

## 📈 Expense Statistics

The application provides:

- Category-based expense distribution
- Expense comparison chart
- Visual representation of spending habits

---

## 🎯 Future Improvements

- Edit Expense
- Dark Mode
- Monthly Reports
- Income Tracking
- Budget Planning
- Pie Charts
- Firebase Authentication
- Cloud Synchronization
- Export PDF Reports
- Multi-language Support

---

## 🛠️ Installation

### Clone Repository

```bash
git clone https://github.com/rokayaraka/Expense_Tracker_Flutter.git
```

### Navigate to Project

```bash
cd Expense_Tracker_Flutter
```

### Install Packages

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

---

## 📚 Learning Outcomes

Through this project, I learned:

- Flutter Widget Tree
- Clean Architecture
- State Management
- SharedPreferences
- Form Validation
- Local Data Persistence
- Responsive UI Design
- Flutter Navigation
- Custom Widgets

---

## 👨‍💻 Developer

**Rokaya Raka**

Flutter Developer | AI Enthusiast | CSE Student

### Skills
- Flutter
- Dart
- Firebase
- Python
- Django
- Machine Learning
- Computer Vision

---

## 📄 License

This project is developed for educational and portfolio purposes.

---

⭐ If you like this project, please consider giving it a star on GitHub.
