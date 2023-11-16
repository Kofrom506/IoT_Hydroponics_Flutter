// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDDlkSYHAHu3Rm1NxzuiCaNhUjn-pKP2Vk',
    appId: '1:1037163665870:web:640610a7e950884257f39f',
    messagingSenderId: '1037163665870',
    projectId: 'esp32-hydroponics-b613a',
    authDomain: 'esp32-hydroponics-b613a.firebaseapp.com',
    databaseURL: 'https://esp32-hydroponics-b613a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-hydroponics-b613a.appspot.com',
    measurementId: 'G-1Z8QLR08C4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBr94YBT3SF0pXMegAERZx5ejaIJrqC3ls',
    appId: '1:1037163665870:android:6f3392bc9b0cacb957f39f',
    messagingSenderId: '1037163665870',
    projectId: 'esp32-hydroponics-b613a',
    databaseURL: 'https://esp32-hydroponics-b613a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-hydroponics-b613a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDpV9SiSBwx7geulCt18iCEpPQvJtjqV0',
    appId: '1:1037163665870:ios:c1999e7ebfe92f3357f39f',
    messagingSenderId: '1037163665870',
    projectId: 'esp32-hydroponics-b613a',
    databaseURL: 'https://esp32-hydroponics-b613a-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-hydroponics-b613a.appspot.com',
    iosBundleId: 'com.example.flutterHydroponics',
  );
}