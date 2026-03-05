import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default Firebase configuration for this app.
///
/// Generated-style file based on the current Firebase project settings.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions are not configured for web yet. '
        'Run `flutterfire configure` to add web support.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for ios yet. '
          'Run `flutterfire configure` to add ios support.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for macos yet. '
          'Run `flutterfire configure` to add macos support.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for linux yet. '
          'Run `flutterfire configure` to add linux support.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDldEic19tuv3rekxMNLDaAkTGlLIZA_IA',
    appId: '1:589420285489:android:33c220d57099f414cc0f10',
    messagingSenderId: '589420285489',
    projectId: 'store-app-cee16',
    storageBucket: 'store-app-cee16.firebasestorage.app',
  );

  // Temporary Windows config to avoid startup failure during desktop runs.
  // Replace with FlutterFire-generated values via `flutterfire configure`.
  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDldEic19tuv3rekxMNLDaAkTGlLIZA_IA',
    appId: '1:589420285489:android:33c220d57099f414cc0f10',
    messagingSenderId: '589420285489',
    projectId: 'store-app-cee16',
    storageBucket: 'store-app-cee16.firebasestorage.app',
  );
}
