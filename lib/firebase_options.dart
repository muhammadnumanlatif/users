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
    apiKey: 'AIzaSyBoZoj5ZwqD2ho0Cb2qPfgUCJAP6eZC7M4',
    appId: '1:989152477613:web:35af2c83b01d1ab31e6124',
    messagingSenderId: '989152477613',
    projectId: 'uber-clone-114b0',
    authDomain: 'uber-clone-114b0.firebaseapp.com',
    databaseURL: 'https://uber-clone-114b0-default-rtdb.firebaseio.com',
    storageBucket: 'uber-clone-114b0.appspot.com',
    measurementId: 'G-VYQRMZ724E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSp2Mr6LIXldiFjRy-Ac31r6i9xBrME5A',
    appId: '1:989152477613:android:58ede6e3d268bf5f1e6124',
    messagingSenderId: '989152477613',
    projectId: 'uber-clone-114b0',
    databaseURL: 'https://uber-clone-114b0-default-rtdb.firebaseio.com',
    storageBucket: 'uber-clone-114b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFJLld8r7X-IMcrTft7ojdmQhKd-J6P44',
    appId: '1:989152477613:ios:101fcbabd20ba06f1e6124',
    messagingSenderId: '989152477613',
    projectId: 'uber-clone-114b0',
    databaseURL: 'https://uber-clone-114b0-default-rtdb.firebaseio.com',
    storageBucket: 'uber-clone-114b0.appspot.com',
    iosClientId: '989152477613-5tv12ept5igdt2o1lp2lj92rhq2tn2ph.apps.googleusercontent.com',
    iosBundleId: 'com.example.users',
  );
}
