import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ioc_example/services/user_database_service.dart';

import '../example_2/form.dart';
import '../models/user.dart';

class Screen3 extends StatefulWidget {
  const Screen3({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  // Retrieve injected service. It'll return the same instance created by the
  // injectDependencies() method.
  UserDatabaseService get dbService => GetIt.I.get<UserDatabaseService>();

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = widget.dbService.get(
      userId: widget.userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    // This form might be the same on Example 2, since it's already refactored.
    return Form2(
      currentName: user.name,
      onSubmit: (String newName) {
        widget.dbService.saveUserName(
          id: user.id,
          name: newName,
        );
      },
    );
  }
}
