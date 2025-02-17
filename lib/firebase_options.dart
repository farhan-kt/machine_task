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
        return macos;
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
    apiKey: 'AIzaSyDBIHzc6-wyi_nLILT5Zef-QFLFTXyhATs',
    appId: '1:642356248753:web:70e330a8c28017056e6290',
    messagingSenderId: '642356248753',
    projectId: 'kayla-appointments',
    authDomain: 'kayla-appointments.firebaseapp.com',
    storageBucket: 'kayla-appointments.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7MUYDygBHX5JbA096rPnv9E3nSSm9B7s',
    appId: '1:642356248753:android:140518a63b6b836f6e6290',
    messagingSenderId: '642356248753',
    projectId: 'kayla-appointments',
    storageBucket: 'kayla-appointments.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByzykWBKY9O13r7oXpKMtNTYmdZ6EN-x4',
    appId: '1:642356248753:ios:1b7d82cd48a059636e6290',
    messagingSenderId: '642356248753',
    projectId: 'kayla-appointments',
    storageBucket: 'kayla-appointments.appspot.com',
    iosBundleId: 'com.example.kaylaMachineTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByzykWBKY9O13r7oXpKMtNTYmdZ6EN-x4',
    appId: '1:642356248753:ios:19b4a6faa784be2f6e6290',
    messagingSenderId: '642356248753',
    projectId: 'kayla-appointments',
    storageBucket: 'kayla-appointments.appspot.com',
    iosBundleId: 'com.example.kaylaMachineTest.RunnerTests',
  );
}
