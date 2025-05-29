import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SearchBar(),
          SizedBox(height: 20),
          Text('Shop', style: TextStyle(fontSize: 24, color: Colors.black)),
        ],
      ),
    );
  }
}
