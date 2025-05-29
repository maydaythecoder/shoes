import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double price;

  const ShoeCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 1.15,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[100],
                    child: const Center(
                      child: Icon(Icons.error_outline, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          // Content Container
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: -0.5,
                      height: 1.1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  // Price
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      letterSpacing: -0.5,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
          ),
          // Add to Cart Button
          SizedBox(
            width: double.infinity,
            height: 28,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
