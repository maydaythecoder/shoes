import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override State<Home> createState() => _HomeState();}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/logo.svg';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              assetName,
              semanticsLabel: 'Nike Logo',
              placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
