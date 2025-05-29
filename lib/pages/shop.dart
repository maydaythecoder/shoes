import 'package:flutter/material.dart';
import '../components/searchbar.dart';
import '../components/card.dart';
import '../models/shoe.dart';
import '../services/shoe_service.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<Shoe> _shoes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadShoes();
  }

  Future<void> _loadShoes() async {
    final shoes = await ShoeService.loadShoes();
    setState(() {
      _shoes = shoes;
      _isLoading = false;
    });
  }

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
                    'Nike',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_shoes.length} Products',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // Search Bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: MySearchBar(),
            ),
            const SizedBox(height: 16),
            // Grid
            Expanded(
              child:
                  _isLoading
                      ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.black,
                          ),
                        ),
                      )
                      : GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                        itemCount: _shoes.length,
                        itemBuilder: (context, index) {
                          final shoe = _shoes[index];
                          return MyCard(
                            imagePath: shoe.imagePath,
                            title: shoe.title,
                            price: shoe.price,
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
