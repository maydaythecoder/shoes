import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/shoe.dart';
import 'firestore_service.dart';

class ShoeService {
  static final ShoeService _instance = ShoeService._internal();
  factory ShoeService() => _instance;
  ShoeService._internal();

  FirestoreService? _firestore;
  List<Shoe>? _cachedShoes;
  bool _isFirebaseAvailable = false;
  bool _isInitialized = false;

  // Initialize Firebase service
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Check if Firebase is initialized
      final app = Firebase.app();
      if (kDebugMode) {
        print('Firebase app found: ${app.name}');
      }

      // Initialize Firestore service
      _firestore = FirestoreService();

      // Test Firebase connection with a timeout
      try {
        final shoes = await _firestore!.getShoes().timeout(
          const Duration(seconds: 5),
          onTimeout: () {
            throw TimeoutException('Firebase connection timed out');
          },
        );
        _isFirebaseAvailable = true;
        if (kDebugMode) {
          print('Firebase service initialized successfully');
          print('Retrieved ${shoes.length} shoes from Firestore');
        }
      } on TimeoutException {
        if (kDebugMode) {
          print('Firebase connection timed out');
        }
        _isFirebaseAvailable = false;
      } catch (e) {
        if (kDebugMode) {
          print('Firebase connection test failed: $e');
        }
        _isFirebaseAvailable = false;
      }
    } on FirebaseException catch (e) {
      _isFirebaseAvailable = false;
      if (kDebugMode) {
        print(
            'Firebase service initialization failed: ${e.code} - ${e.message}');
        print('Stack trace: ${e.stackTrace}');
      }
    } catch (e) {
      _isFirebaseAvailable = false;
      if (kDebugMode) {
        print('Unexpected error during Firebase service initialization: $e');
      }
    } finally {
      _isInitialized = true;
    }
  }

  // Load shoes from Firestore or fallback to local JSON
  Future<List<Shoe>> loadShoes() async {
    try {
      // Return cached data if available
      if (_cachedShoes != null) return _cachedShoes!;

      // Try Firebase if available
      if (_isFirebaseAvailable && _firestore != null) {
        try {
          final shoes = await _firestore!.getShoes();
          _cachedShoes = shoes;
          return shoes;
        } catch (e) {
          if (kDebugMode) {
            print('Firebase fetch failed: $e');
            print('Falling back to local data...');
          }
          _isFirebaseAvailable = false;
        }
      }

      // Fallback to local JSON
      final jsonString = await rootBundle.loadString('assets/data/shoes.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final shoes = (jsonData['shoes'] as List)
          .map((item) => Shoe.fromJson(item as Map<String, dynamic>))
          .toList();
      _cachedShoes = shoes;
      return shoes;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to load shoes: $e');
      }
      throw Exception('Failed to load shoes: $e');
    }
  }

  // Get a single shoe by ID
  Future<Shoe?> getShoe(String id) async {
    try {
      if (_isFirebaseAvailable && _firestore != null) {
        try {
          return await _firestore!.getShoe(id);
        } catch (e) {
          if (kDebugMode) {
            print('Firebase fetch failed: $e');
          }
          _isFirebaseAvailable = false;
        }
      }

      // Fallback to local cache
      if (_cachedShoes != null) {
        return _cachedShoes!.firstWhere(
          (shoe) => shoe.id == id,
          orElse: () => throw Exception('Shoe not found'),
        );
      }
      throw Exception('Failed to get shoe: No data available');
    } catch (e) {
      if (kDebugMode) {
        print('Error getting shoe: $e');
      }
      rethrow;
    }
  }

  // Clear cache
  void clearCache() {
    _cachedShoes = null;
  }

  // Check if Firebase is available
  bool get isFirebaseAvailable => _isFirebaseAvailable;
}
