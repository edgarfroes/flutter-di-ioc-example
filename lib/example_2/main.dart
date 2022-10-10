import 'package:flutter/material.dart';
import 'package:ioc_example/example_2/screen.dart';
import 'package:ioc_example/services/user_database_service_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _dbService = UserDatabaseServiceImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screen2(
        dbService: _dbService,
        userId: '123',
      ),
    );
  }
}
