import 'dart:math';

import 'package:ioc_example/services/user_database_service.dart';

import '../models/user.dart';

class UserDatabaseServiceImpl implements UserDatabaseService {
  @override
  User get({
    required String userId,
  }) {
    _simulateError();

    return User(
      id: '1',
      name: 'Jon Snow',
    );
  }

  @override
  void saveUserName({
    required String id,
    required String name,
  }) {
    _simulateError();
  }

  @override
  void dispose() {
    //
  }
}

final _random = Random();

// Simulate random database offline state.
void _simulateError() {
  // 25% change of error.
  final randomNumber = _random.nextInt(3);

  if (randomNumber == 0) {
    throw Exception('Database is offline');
  }
}
