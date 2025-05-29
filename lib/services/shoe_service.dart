import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/shoe.dart';

class ShoeService {
  static Future<List<Shoe>> loadShoes() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/shoes.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> shoesJson = jsonData['shoes'] as List;
      return shoesJson.map((json) => Shoe.fromJson(json)).toList();
    } catch (e) {
      print('Error loading shoes: $e');
      return [];
    }
  }
}
