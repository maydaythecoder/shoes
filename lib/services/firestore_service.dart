import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/shoe.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'shoes';

  // Get all shoes
  Future<List<Shoe>> getShoes() async {
    try {
      final snapshot = await _firestore.collection(_collection).get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Shoe.fromJson({
          ...data,
          'id': doc.id, // Use Firestore document ID
        });
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch shoes: $e');
    }
  }

  // Get a single shoe by ID
  Future<Shoe?> getShoe(String id) async {
    try {
      final doc = await _firestore.collection(_collection).doc(id).get();
      if (!doc.exists) return null;

      final data = doc.data()!;
      return Shoe.fromJson({...data, 'id': doc.id});
    } catch (e) {
      throw Exception('Failed to fetch shoe: $e');
    }
  }

  // Add a new shoe
  Future<String> addShoe(Shoe shoe) async {
    try {
      final docRef =
          await _firestore.collection(_collection).add(shoe.toJson());
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add shoe: $e');
    }
  }

  // Update a shoe
  Future<void> updateShoe(String id, Shoe shoe) async {
    try {
      await _firestore.collection(_collection).doc(id).update(shoe.toJson());
    } catch (e) {
      throw Exception('Failed to update shoe: $e');
    }
  }

  // Delete a shoe
  Future<void> deleteShoe(String id) async {
    try {
      await _firestore.collection(_collection).doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete shoe: $e');
    }
  }
}
