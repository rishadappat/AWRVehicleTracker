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
    apiKey: 'AIzaSyBYRJbMx3nMOG88soZXK_CHaLiJtxTOgHM',
    appId: '1:20133892266:web:94ed25a7d54c5715d640d3',
    messagingSenderId: '20133892266',
    projectId: 'awrvehicletracking',
    authDomain: 'awrvehicletracking.firebaseapp.com',
    databaseURL: 'https://awrvehicletracking-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'awrvehicletracking.appspot.com',
    measurementId: 'G-04107FRGDG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-4RGrOlXIiGoQJFqSm_ZFDQzkdGAa_Xc',
    appId: '1:20133892266:android:92961ddff5b6ea0dd640d3',
    messagingSenderId: '20133892266',
    projectId: 'awrvehicletracking',
    databaseURL: 'https://awrvehicletracking-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'awrvehicletracking.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxrmyIEP077TDzzEH6iu34Dd7S2aOhGGY',
    appId: '1:20133892266:ios:9693381d24fd21f3d640d3',
    messagingSenderId: '20133892266',
    projectId: 'awrvehicletracking',
    databaseURL: 'https://awrvehicletracking-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'awrvehicletracking.appspot.com',
    iosBundleId: 'com.example.awrVehicleTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxrmyIEP077TDzzEH6iu34Dd7S2aOhGGY',
    appId: '1:20133892266:ios:9693381d24fd21f3d640d3',
    messagingSenderId: '20133892266',
    projectId: 'awrvehicletracking',
    databaseURL: 'https://awrvehicletracking-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'awrvehicletracking.appspot.com',
    iosBundleId: 'com.example.awrVehicleTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYRJbMx3nMOG88soZXK_CHaLiJtxTOgHM',
    appId: '1:20133892266:web:c5ac20e00d972088d640d3',
    messagingSenderId: '20133892266',
    projectId: 'awrvehicletracking',
    authDomain: 'awrvehicletracking.firebaseapp.com',
    databaseURL: 'https://awrvehicletracking-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'awrvehicletracking.appspot.com',
    measurementId: 'G-E358B72PVX',
  );
}
