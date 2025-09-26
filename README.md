# Hygiene Tracker App 🧼

A cross-platform Flutter application designed to help users(mainly kids) establish, maintain, and track their personal hygiene routines through gamification and smart notifications.

## Features

### Core Functionality
- **Daily Habit Tracking**: Monitor essential hygiene activities like brushing teeth, showering, and personal care routines
- **Streak Counter**: Track consecutive days of completed habits to build motivation and consistency
- **Smart Reminders**: Customizable push notifications to maintain daily routines
- **Progress Analytics**: Visual insights into hygiene habit patterns and improvements

### User Experience
- **Intuitive Interface**: Clean, Material Design-based UI with custom hygiene-themed icons
- **Educational Content**: Integrated YouTube player for hygiene tips and tutorials
- **Offline Support**: Local data storage ensures functionality without internet connectivity
- **Multi-language Ready**: Internationalization support for global accessibility

## Getting Started

Prerequisites:
- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code with Flutter extensions
- Git

Installation:
1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/hygiene_tracker.git
   cd hygiene_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For web
   flutter run -d chrome
   
   # For mobile (with device connected)
   flutter run
   
   # For desktop
   flutter run -d windows  # or macos/linux
   ```

Project Structure:
```
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models and classes
├── screens/                  # UI screens and pages
├── widgets/                  # Reusable UI components
├── services/                 # Business logic and data services
└── utils/                    # Helper functions and constants

assets/
├── images/                   # App icons and illustrations
└── animations/               # Lottie animations (if any)
```

Tech Stack
- Flutter: Cross-platform UI toolkit
- Dart: Programming language

Key Dependencies
- 'provider': State management solution
- 'shared_preferences': Local data persistence
- 'awesome_notifications': Advanced notification system
- 'youtube_player_flutter': Video content integration
- 'flutter_inappwebview': Web content display

Supported Platforms
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

App Architecture:
This project follows the **Provider Pattern** for state management and implements a clean architecture approach:
- Presentation Layer: UI components and screens
- Business Logic Layer: Providers and services
- Data Layer: Local storage and data models

Key Learning Outcomes:
This project demonstrates proficiency in:
- Cross-platform mobile development with Flutter
- State management using Provider pattern
- Local data persistence and user preferences
- Push notification implementation
- YouTube API integration
- Responsive UI design principles
- Multi-platform deployment strategies


 🚧 Future Enhancements

- [ ] Cloud synchronization across devices
- [ ] Social features and family sharing
- [ ] Advanced analytics and reporting
- [ ] Integration with health tracking APIs
- [ ] Customizable themes and personalization
- [ ] Habit suggestion engine using AI

 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


- GitHub: @Uzo-Domain(https://github.com/Uzo-Domain)
- LinkedIn: Uzoma Oduah(www.linkedin.com/in/uzoma-oduah-13474a198)

 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI/UX inspiration
- Open source community for the fantastic packages

---

*Built with ❤️ using Flutter*
