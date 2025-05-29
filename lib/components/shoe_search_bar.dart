import 'package:flutter/material.dart';

class ShoeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const ShoeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search for shoes...',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
            letterSpacing: -0.5,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
          suffixIcon:
              controller?.text.isNotEmpty == true
                  ? IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: onClear,
                  )
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
