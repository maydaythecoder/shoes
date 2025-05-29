import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SearchBar(),
          SizedBox(height: 20),
          Text('Cart', style: TextStyle(fontSize: 24, color: Colors.black)),
        ],
      ),
    );
  }
}
