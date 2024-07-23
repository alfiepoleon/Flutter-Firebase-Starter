# Flutter-Firebase-Starter README

Introduction:
Flutter-Firebase-Starter is a comprehensive library aimed at kickstarting your Flutter app development with integrated Firebase services and GetX 5. It includes a set structure for models, controllers, UI components, and Firebase setup.

## Disclaimer ⚠️

This FlutterFire Launchpad project is a personal starter kit that I've developed based on my preferences and workflows. While I've strived to follow best practices, it will not perfectly align with everyone's specific needs or preferred tools.

You are encouraged to explore, modify, and adapt this starter kit to fit your own project requirements. Feel free to suggest alternative tools or approaches – constructive feedback is always welcome. However, please refrain from mocking or disparaging any specific tools or technologies.

## Features

- **State Management and Routing**: Utilizes `GetX 5` for efficient state management and navigation within the app. The library includes a few pre-defined named routes making the navigation setup straightforward. Learn more about GetX [here](https://pub.dev/packages/get).

- **Localization Support**: Comes with built-in translation files for English (en_US), French (fr_FR), Spanish (es_ES), and Swahili (sw_KE) to facilitate multilingual support using the GetX package. This makes it easy to manage localized content throughout the app.

- **Firebase Integration**:
- **Firebase Authentication**: Configured to use Google Sign-In, simplifying user authentication processes.
- **Firebase Crashlytics**: Integrated to help track, prioritize, and fix stability issues that erode app quality.
- **Firebase Analytics**: Set up to analyze user behavior and improve app performance based on user data.

- **Theming**:
- **Central Color and Text Themes**: Define your app’s personality through a centralized theming system which includes colors, text styles, and the overall theme. This approach ensures consistency and ease of modifications across the app.

Getting Started:

1. Prerequisites:

   - Install Flutter SDK (version 3.0+).
   - Install Dart SDK (version 2.18+).
   - IDE with Flutter support (e.g., VSCode or Android Studio).
   - This library is most suitable for a new Flutter project where no modifications have been made to the `lib` folder or `dependencies`. For dependencies, ensure all packages listed in the provided `pubspec.yaml` are present. If your `lib` folder has been modified, some adjustments may be necessary, which might include partial imports or adapting the existing code structure to integrate with this library.

2. Create a new Flutter project:
   ```bash
      flutter create <your-app-name>
      cd <your-app-name>
   ```
3. Replace the lib folder:

   - Delete the existing lib folder.
   - Copy the lib folder from Flutter-Firebase-Starter into your project directory.

4. Updating Package Imports:

   - Replace all instances of `package:firebase_core` in your code with `package:<your_pubspec_name>`, where `<your_pubspec_name>` is the name at the top of your `pubspec.yaml` file. This step ensures that all Firebase imports are correctly linked to your project's namespace. Use the search-and-replace function in your IDE for an efficient update across the entire folder.

5. Update pubspec.yaml:

   - Ensure all the dependencies listed belowe are present in your pubspec.yaml:

   ```
   dependencies:
      flutter:
         sdk: flutter
      flutter_localizations:
         sdk: flutter
      cached_network_image: ^3.3.1
      cupertino_icons: ^1.0.6
      flutter_spinkit: ^5.2.1
      firebase_analytics: ^11.2.0
      firebase_auth: ^5.1.2
      firebase_core: ^3.2.0
      firebase_crashlytics: ^4.0.3
      fluttertoast: ^8.2.6
      get: ^5.0.0-release-candidate-6
      google_fonts: ^6.2.1
      google_sign_in: ^6.2.1
      intl: any
      loading_overlay: ^0.3.0
      sign_in_button: ^3.2.0
   ```

6. Install dependencies:

   ```bash
   flutter pub get
   ```

7. Firebase setup:

   - Follow the detailed setup guide for Firebase: https://firebase.google.com/docs/flutter/setup
   - Configure Android and iOS as per the Firebase instructions.

8. Enable Firebase Google Authentication:

   - Follow this guide to enable Google Sign-In in your Firebase project: https://firebase.google.com/docs/auth/web/google-signin

9. Run the app:
   ```bash
   flutter run
   ```

Configuration:
Ensure Firebase services such as Authentication and Crashlytics are enabled and set up appropriately in your Firebase project settings.
