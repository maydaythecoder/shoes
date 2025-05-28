import 'package:flutter/material.dart';
import 'pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}
