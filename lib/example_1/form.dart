import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/user_database_service_impl.dart';

class Form1 extends StatefulWidget {
  const Form1({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  late final User user;
  final _dbService = UserDatabaseServiceImpl();

  @override
  void initState() {
    super.initState();

    user = _dbService.get(userId: widget.userId);
  }

  void saveUser({
    required String name,
  }) {
    _dbService.saveUserName(id: user.id, name: name);
  }

  @override
  void dispose() {
    _dbService.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current name: ${user.name}'),
        MaterialButton(
          onPressed: () {
            saveUser(name: 'Aegon Targaryen');
          },
        )
      ],
    );
  }
}
