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
    apiKey: 'AIzaSyAxMz3YSBcZl5_ebfUZXvYPO3QXIxDkiwg',
    appId: '1:369897971507:web:314bd12ab4b88e5c05e846',
    messagingSenderId: '369897971507',
    projectId: 'esendo-90aa9',
    authDomain: 'esendo-90aa9.firebaseapp.com',
    databaseURL: 'https://esendo-90aa9-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'esendo-90aa9.appspot.com',
    measurementId: 'G-QR7BRYRKG0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB54gI7f8AgygFK2dhDMvc7ihO43r39FZU',
    appId: '1:369897971507:android:584d180889ef378805e846',
    messagingSenderId: '369897971507',
    projectId: 'esendo-90aa9',
    databaseURL: 'https://esendo-90aa9-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'esendo-90aa9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDzOB6h-no2gAtj8vOdXA1qAlINylqcr8',
    appId: '1:369897971507:ios:e7b65ea768d1dbab05e846',
    messagingSenderId: '369897971507',
    projectId: 'esendo-90aa9',
    databaseURL: 'https://esendo-90aa9-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'esendo-90aa9.appspot.com',
    androidClientId: '369897971507-6nq9fitvjl3gnrttuoj5pbcssejpalbe.apps.googleusercontent.com',
    iosClientId: '369897971507-qg6kag7d7154apt12gm2of93gk1gaijj.apps.googleusercontent.com',
    iosBundleId: 'com.esendo.esendo',
  );
}
