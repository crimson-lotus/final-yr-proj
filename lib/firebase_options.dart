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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCi2hLOYAShbRcxQDUDlemLZ6udhMDGPEc',
    appId: '1:648355682473:web:41ef6dc5b39d1ae03bb1b8',
    messagingSenderId: '648355682473',
    projectId: 'e-learn-app-alpha',
    authDomain: 'e-learn-app-alpha.firebaseapp.com',
    storageBucket: 'e-learn-app-alpha.appspot.com',
    measurementId: 'G-0Q5ESDY9K0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAF5ejt8KOLcCb5Y4s8j_cf_33bBItp1lA',
    appId: '1:648355682473:android:0b0f96d6ca600acb3bb1b8',
    messagingSenderId: '648355682473',
    projectId: 'e-learn-app-alpha',
    storageBucket: 'e-learn-app-alpha.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5gSXSFK8iJQR6_siTP5Bq1HlFt5OvkWg',
    appId: '1:648355682473:ios:15f892e386cffc9f3bb1b8',
    messagingSenderId: '648355682473',
    projectId: 'e-learn-app-alpha',
    storageBucket: 'e-learn-app-alpha.appspot.com',
    iosClientId: '648355682473-6d6c04g325ge1jacc33j14hu7s1dit70.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalYrProject',
  );
}
