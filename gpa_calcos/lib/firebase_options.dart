// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAnIbNhIuV4HfsBySew-gdwsEpZtRxTDsA',
    appId: '1:324243423213:web:8e1ec62612f02834f0f1e4',
    messagingSenderId: '324243423213',
    projectId: 'gpa-guide',
    authDomain: 'gpa-guide.firebaseapp.com',
    storageBucket: 'gpa-guide.appspot.com',
    measurementId: 'G-RDNGQJBWFL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCFEybNxqkayFyHEWdupW8EhVnG3RDjH0',
    appId: '1:324243423213:android:346764e40576b0a6f0f1e4',
    messagingSenderId: '324243423213',
    projectId: 'gpa-guide',
    storageBucket: 'gpa-guide.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB983M4dXUk1iXAu9Izzdgw_xT6jIb-qq8',
    appId: '1:324243423213:ios:a621a4ad851126fff0f1e4',
    messagingSenderId: '324243423213',
    projectId: 'gpa-guide',
    storageBucket: 'gpa-guide.appspot.com',
    iosBundleId: 'com.example.gpaCalcos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB983M4dXUk1iXAu9Izzdgw_xT6jIb-qq8',
    appId: '1:324243423213:ios:a621a4ad851126fff0f1e4',
    messagingSenderId: '324243423213',
    projectId: 'gpa-guide',
    storageBucket: 'gpa-guide.appspot.com',
    iosBundleId: 'com.example.gpaCalcos',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnIbNhIuV4HfsBySew-gdwsEpZtRxTDsA',
    appId: '1:324243423213:web:77da1b46c7c3c0d0f0f1e4',
    messagingSenderId: '324243423213',
    projectId: 'gpa-guide',
    authDomain: 'gpa-guide.firebaseapp.com',
    storageBucket: 'gpa-guide.appspot.com',
    measurementId: 'G-DHY9BT9JYZ',
  );
}