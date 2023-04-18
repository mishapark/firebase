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
    apiKey: 'AIzaSyDrIaLdzgAOvXjTbI-AtGoSRUiCiDH1qHM',
    appId: '1:445861245260:web:ec76f0bcf34c474d709fe9',
    messagingSenderId: '445861245260',
    projectId: 'shopping-list-e2233',
    authDomain: 'shopping-list-e2233.firebaseapp.com',
    storageBucket: 'shopping-list-e2233.appspot.com',
    measurementId: 'G-913FCP0F9V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhuIHW6GwvHU93QUkXfOQ-wnsNh4-SxBk',
    appId: '1:445861245260:android:198cb6d3e7449d76709fe9',
    messagingSenderId: '445861245260',
    projectId: 'shopping-list-e2233',
    storageBucket: 'shopping-list-e2233.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACPU79s5nEhnWX1hJXWM380F5bpnSc-as',
    appId: '1:445861245260:ios:87001d2e3fe70d9c709fe9',
    messagingSenderId: '445861245260',
    projectId: 'shopping-list-e2233',
    storageBucket: 'shopping-list-e2233.appspot.com',
    iosClientId: '445861245260-2s797ge41ht3ca93ke5e48qq5lhll3vd.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebase',
  );
}