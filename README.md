# 🦅 Falcon Gym

**Falcon Gym** is a Flutter mobile application designed to provide a simple and convenient experience for gym members to manage their activities, book sports facilities, and explore workout routines.

The app combines **gym membership services, sports reservations, and simple workout guidance** in one application.

## ✨ Features

### 🔐 Authentication

* User registration and login
* Supabase Authentication
* Persistent user sessions
* User profile

### 🏓 Sports Booking

Users can browse and book available sports facilities:

* 🏓 Ping Pong
* 🎱 Billiards
* 🎱 Snooker
* 🎾 Padel
* 🥎 Squash

Each sport has its own available time slots, allowing users to:

* Select a date
* View available and booked time slots
* Book an available slot
* View their previous and upcoming bookings

### 🏋️ Gym

The gym section provides simple workout guidance organized into:

* Push Day
* Pull Day
* Leg Day

Each workout contains basic exercises to help users follow their training routine.

### 👤 Profile

Users can view and manage their profile information and membership category.

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **Supabase**
* **Supabase Auth**
* **GoRouter**
* **Cubit / Bloc**
* **Font Awesome Flutter**

## 🏗️ Architecture

The project follows a feature-based Flutter structure with separation between:

* Presentation
* Views
* Widgets
* Routing
* Core utilities
* Backend / Supabase integration

The goal is to keep the codebase simple, maintainable, and easy to extend without unnecessary complexity.

## 📱 Main Screens

* Splash Screen
* Home
* Sports & Activities
* Sport Booking
* My Bookings
* Gym & Workouts
* Profile
* Authentication

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/yasser-osamaa/falcon_gym.git
```

### 2. Navigate to the project

```bash
cd falcon_gym
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Configure Supabase

Create your Supabase project and add the required Supabase URL and anon key to the project's environment configuration.

### 5. Run the application

```bash
flutter run
```

## 🔮 Future Improvements

* Online payment for bookings
* Booking cancellation
* Push notifications
* More workout plans
* Exercise images and videos
* More detailed membership management
* Admin dashboard for managing sports and reservations
* Improved booking conflict handling

## 👨‍💻 Developer

**Yasser Osama**

Flutter Developer | Computer Science Graduate

Built with Flutter ❤️
