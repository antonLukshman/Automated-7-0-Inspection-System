import 'package:flutter/material.dart';
import 'screens/flag_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flag App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const FlagScreen(),
    );
  }
}
