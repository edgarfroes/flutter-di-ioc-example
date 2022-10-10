import 'package:flutter/material.dart';

import 'screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen1(),
    );
  }
}
