import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ioc_example/example_3/screen.dart';
import 'package:ioc_example/services/user_database_service.dart';
import 'package:ioc_example/services/user_database_service_impl.dart';

void main() {
  // Inject dependencies using a service locator.
  injectDependencies();

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
      home: const Screen3(
        userId: '123',
      ),
    );
  }
}

void injectDependencies() {
  // Use GetIt to register this service's implementation.
  // Note that it's injecting to an interface.
  GetIt.I.registerSingleton<UserDatabaseService>(UserDatabaseServiceImpl());
}
