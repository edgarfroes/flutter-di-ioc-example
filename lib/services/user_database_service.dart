import '../models/user.dart';

abstract class UserDatabaseService {
  User get({
    required String userId,
  });

  void saveUserName({
    required String id,
    required String name,
  });

  void dispose();
}
