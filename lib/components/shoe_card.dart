import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoe.dart';
import '../pages/product_detail.dart';
import '../services/cart_service.dart';

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cart, child) {
        final isInCart = cart.isInCart(shoe);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(shoe: shoe),
              ),
            );
          },
          child: Container(
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
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: Image.asset(
                      shoe.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[100],
                          child: const Center(
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.grey,
                            ),
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
                          shoe.title,
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
                          '\$${shoe.price.toStringAsFixed(2)}',
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
                    onPressed: () {
                      if (isInCart) {
                        cart.removeItem(shoe);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${shoe.title} removed from cart'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } else {
                        cart.addItem(shoe);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${shoe.title} added to cart'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isInCart ? Colors.grey[300] : Colors.black,
                      foregroundColor: isInCart ? Colors.black : Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                      ),
                    ),
                    child: Text(
                      isInCart ? 'Remove from Cart' : 'Add to Cart',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        height: 1.1,
                        color: isInCart ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
