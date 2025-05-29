import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoe.dart';
import '../services/cart_service.dart';

class ProductDetail extends StatelessWidget {
  final Shoe shoe;

  const ProductDetail({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartService>(
      builder: (context, cart, child) {
        final isInCart = cart.isInCart(shoe);

        return Scaffold(
          backgroundColor: Colors.grey[50],
          body: CustomScrollView(
            slivers: [
              // App Bar with Image
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width * 1.15,
                pinned: true,
                backgroundColor: Colors.grey[50],
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () => Navigator.pop(context),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(shoe.imagePath, fit: BoxFit.cover),
                ),
              ),
              // Product Details
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        shoe.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          letterSpacing: -1,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Price
                      Text(
                        '\$${shoe.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Description
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        shoe.description.isNotEmpty ? shoe.description : 'No description available',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          height: 1.5,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Add to Cart Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (isInCart) {
                              cart.removeItem(shoe);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${shoe.title} removed from cart',
                                  ),
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
                            foregroundColor:
                                isInCart ? Colors.black : Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            isInCart ? 'Remove from Cart' : 'Add to Cart',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              color: isInCart ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
