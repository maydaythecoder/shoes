import 'package:flutter/material.dart';
import '../components/shoe_search_bar.dart';
import '../components/shoe_card.dart';
import '../models/shoe.dart';
import '../services/shoe_service.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final ShoeService _shoeService = ShoeService();
  List<Shoe> _shoes = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _initializeAndLoadShoes();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _initializeAndLoadShoes() async {
    try {
      await _shoeService.initialize();
      await _loadShoes();
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to load shoes. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _loadShoes() async {
    final shoes = await _shoeService.loadShoes();
    if (mounted) {
      setState(() {
        _shoes = shoes;
        _isLoading = false;
      });
    }
  }

  List<Shoe> get _filteredShoes {
    if (_searchQuery.isEmpty) return _shoes;
    return _shoes.where((shoe) {
      return shoe.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
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
                      letterSpacing: -1, // Nike-style typography
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_filteredShoes.length} Products',
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
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                onClear: () {
                  _searchController.clear();
                  setState(() {
                    _searchQuery = '';
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            // Grid
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black,
                        ),
                      ),
                    )
                  : _filteredShoes.isEmpty
                      ? Center(
                          child: Text(
                            'No shoes found',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              letterSpacing: -0.5, // Nike-style typography
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
                          itemCount: _filteredShoes.length,
                          itemBuilder: (context, index) {
                            final shoe = _filteredShoes[index];
                            return ShoeCard(shoe: shoe);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
