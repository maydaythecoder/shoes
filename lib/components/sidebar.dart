import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  final String assetName = 'assets/images/logo.svg';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SvgPicture.asset(
                assetName,
                width: 50,
                height: 50,
                semanticsLabel: 'Nike Logo',
                placeholderBuilder:
                    (BuildContext context) => Container(
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(),
                    ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            dense: true,
            leading: const Icon(Icons.home_outlined, size: 20),
            title: const Text('Home', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.shopping_bag_outlined, size: 20),
            title: const Text('New & Featured', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.man_outlined, size: 20),
            title: const Text('Men', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.woman_outlined, size: 20),
            title: const Text('Women', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.child_care_outlined, size: 20),
            title: const Text('Kids', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.percent_outlined, size: 20),
            title: const Text('Sale', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          const Divider(),
          ListTile(
            dense: true,
            leading: const Icon(Icons.settings_outlined, size: 20),
            title: const Text('Settings', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.help_outline, size: 20),
            title: const Text('Help', style: TextStyle(fontSize: 14)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}