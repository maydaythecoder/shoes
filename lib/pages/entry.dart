import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/logo.svg';
    return Scaffold(
      body: Column(
        children: [
          // Nike Logo
          const SizedBox(height: 100),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                assetName,
                width: 300,
                height: 300,
                semanticsLabel: 'Nike Logo',
                placeholderBuilder:
                    (BuildContext context) => Container(
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(),
                    ),
              ),
            ),
          ),

          // Just Do It Text
          const Text(
            'Just Do It',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 30),

          // Brand New Sneakers and Custom Kicks with premium quality Text
          const Text(
            'Brand New Sneakers and Custom Kicks with premium quality',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Shop Now Button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            child: Container(
              width: 300,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Shop Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
