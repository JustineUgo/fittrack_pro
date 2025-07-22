
````markdown
# FitTrack Pro

A 2-screen fitness tracking app built with Flutter, featuring advanced UI animations, native Android/iOS integrations, and robust state management.

---

## Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Architecture](#architecture)  
- [Setup & Running](#setup--running)  
- [Testing](#testing)  
- [Known Issues & Trade-offs](#known-issues--trade-offs)  
- [Contact](#contact)

---

## Overview

FitTrack Pro is a modern fitness tracker app demonstrating:

- Animated dashboard with custom-painted charts and progress rings  
- Immersive workout session screen with live heart rate simulation  
- Background service on Android and background processing on iOS  
- Method channel communication between Flutter and native platforms  
- Clean BLoC/Cubit-based state management for scalable architecture

---

## Features

### UI

- Dashboard with animated stats cards and custom charts (no 3rd party libs)  
- Morphing Floating Action Button with smooth transitions and haptic feedback  
- Custom circular progress indicators and swipe gesture controls  
- Responsive design supporting both portrait and landscape modes  

### State Management

- `DashboardCubit` manages dashboard data and workout triggers  
- `WorkoutBloc` handles workout session state, timers, and sensor simulations  
- Clean separation of UI and business logic, with proper error/loading states  

### Native Integration

- Android foreground service simulating heart rate, steps, and calories  
- iOS background app refresh, local notifications, and Core Motion simulation  
- Method channels for seamless two-way communication between Flutter and native code  

---

## Architecture

- **Repository pattern** abstracts data sources for scalability and testability  
- Feature-based folder structure for modularity (`features/dashboard`, `features/workout`)  
- Dependency injection for decoupling and easier testing  
- Custom UI components implemented using Flutter's `CustomPainter` and animation framework  

---

## Setup & Running

### Prerequisites

- Flutter SDK (stable channel recommended)  
- Android Studio or Xcode for platform-specific builds  
- For iOS: Xcode 14 or later, CocoaPods installed  

### Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/JustineUgo/fittrack_pro.git
   cd fittrack_pro
````

2. Fetch dependencies:

   ```bash
   flutter pub get
   ```

3. For iOS, install pods:

   ```bash
   cd ios
   pod install
   cd ..
   ```

4. Run the app on your emulator or device:

   ```bash
   flutter run
   ```

---

## Testing

* Unit tests 
* Widget tests 

Run tests with:

```bash
flutter test
```

---

## Known Issues & Trade-offs

* Sensor data (heart rate, steps) is simulated; no real hardware integration
* Local notifications dont contain custom controls to meet deadline

---

