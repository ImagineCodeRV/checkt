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
    apiKey: 'AIzaSyALOF5Z4NqK7XIMCFCR4rq6Z2kJK0gJCIU',
    appId: '1:690253323466:web:a3b0c89029777f37796833',
    messagingSenderId: '690253323466',
    projectId: 'checkt-de471',
    authDomain: 'checkt-de471.firebaseapp.com',
    storageBucket: 'checkt-de471.appspot.com',
    measurementId: 'G-0SDD8NWV51',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDN7V-LBUrNe8tVsTc5X4c1dNRPIacAs-4',
    appId: '1:690253323466:android:cc7444122182afa1796833',
    messagingSenderId: '690253323466',
    projectId: 'checkt-de471',
    storageBucket: 'checkt-de471.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3QrsvyTWOy3cT5ZJjTpLht0AozHTNftw',
    appId: '1:690253323466:ios:a9c94eba7856ca62796833',
    messagingSenderId: '690253323466',
    projectId: 'checkt-de471',
    storageBucket: 'checkt-de471.appspot.com',
    iosClientId: '690253323466-uq749dern3pvhq1st0kpoetifm2fhm86.apps.googleusercontent.com',
    iosBundleId: 'com.example.checkt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3QrsvyTWOy3cT5ZJjTpLht0AozHTNftw',
    appId: '1:690253323466:ios:a9c94eba7856ca62796833',
    messagingSenderId: '690253323466',
    projectId: 'checkt-de471',
    storageBucket: 'checkt-de471.appspot.com',
    iosClientId: '690253323466-uq749dern3pvhq1st0kpoetifm2fhm86.apps.googleusercontent.com',
    iosBundleId: 'com.example.checkt',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyALOF5Z4NqK7XIMCFCR4rq6Z2kJK0gJCIU',
    appId: '1:690253323466:web:ebe237b03859f194796833',
    messagingSenderId: '690253323466',
    projectId: 'checkt-de471',
    authDomain: 'checkt-de471.firebaseapp.com',
    storageBucket: 'checkt-de471.appspot.com',
    measurementId: 'G-0TCKTR8ETB',
  );
}