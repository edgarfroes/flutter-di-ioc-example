import 'package:flutter/material.dart';
import 'package:ioc_example/services/user_database_service.dart';

import 'form.dart';
import '../models/user.dart';

class Screen2 extends StatefulWidget {
  const Screen2({
    Key? key,
    required this.userId,
    required this.dbService,
  }) : super(key: key);

  final String userId;

  final UserDatabaseService dbService;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
