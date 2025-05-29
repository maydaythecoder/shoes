import 'package:flutter/material.dart';
import '../components/shoe_search_bar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1, // Nike-style typography
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '0 Items',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      letterSpacing: -0.5, // Nike-style typography
                    ),
                  ),
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ShoeSearchBar(
                onChanged: (value) {
                  // Implement cart search
                },
              ),
            ),
            const SizedBox(height: 16),
            // Cart Items
            Expanded(
              child: Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    letterSpacing: -0.5, // Nike-style typography
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
