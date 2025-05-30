import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:shoes/firebase_options.dart';

Future<void> main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Read the JSON file
  final file = File('assets/data/shoes.json');
  final jsonString = await file.readAsString();
  final jsonData = json.decode(jsonString) as Map<String, dynamic>;
  final shoes = jsonData['shoes'] as List;

  // Upload to Firestore
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();
  final collection = firestore.collection('shoes');

  for (final shoe in shoes) {
    final docRef = collection.doc();
    batch.set(docRef, shoe);
  }

  try {
    await batch.commit();
    if (kDebugMode) {
      print('Successfully uploaded ${shoes.length} shoes to Firestore');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error uploading shoes: $e');
    }
  }

  exit(0);
}
