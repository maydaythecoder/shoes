import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Shop Page',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );
  }
}
