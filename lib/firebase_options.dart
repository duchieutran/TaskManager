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
    apiKey: 'AIzaSyAfW94qpumznnG0RxxkmauHtM5nIWV9Rx0',
    appId: '1:672232420579:web:90643a53737f5304ee81d6',
    messagingSenderId: '672232420579',
    projectId: 'member-manager-78c4a',
    authDomain: 'member-manager-78c4a.firebaseapp.com',
    storageBucket: 'member-manager-78c4a.appspot.com',
    measurementId: 'G-PFFRYH8ZK1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3OHkwr9DC0gqOMpLjeiigt_EqUy8hmKc',
    appId: '1:672232420579:android:7dfb32ae30701980ee81d6',
    messagingSenderId: '672232420579',
    projectId: 'member-manager-78c4a',
    storageBucket: 'member-manager-78c4a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBMM9YF7mXkD_jj3aSD1J8uFIkmiduPvQ',
    appId: '1:672232420579:ios:a65795673b6b8348ee81d6',
    messagingSenderId: '672232420579',
    projectId: 'member-manager-78c4a',
    storageBucket: 'member-manager-78c4a.appspot.com',
    iosBundleId: 'com.example.taskmanager',
  );
}
