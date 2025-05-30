import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        elevation: 0,
        backgroundColor: Colors.grey[50],
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag),
            label: 'Shop',
            backgroundColor: currentIndex == 0 ? Colors.grey[50] : Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart), 
            label: 'Cart',
            backgroundColor: currentIndex == 1 ? Colors.grey[50] : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
