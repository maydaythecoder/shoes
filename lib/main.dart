import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase first
  FirebaseApp? app;
  try {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (kDebugMode) {
      print('Firebase initialized successfully with app: ${app.name}');
    }
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print('Firebase initialization failed: ${e.code} - ${e.message}');
      print('Stack trace: ${e.stackTrace}');
    }
    // Don't rethrow - we'll fall back to local data
  } catch (e) {
    if (kDebugMode) {
      print('Unexpected error during Firebase initialization: $e');
    }
    // Don't rethrow - we'll fall back to local data
  }

  // Run the app regardless of Firebase initialization status
  runApp(const App());
}
