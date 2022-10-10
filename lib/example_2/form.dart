import 'package:flutter/material.dart';

class Form2 extends StatelessWidget {
  const Form2({
    Key? key,
    required this.currentName,
    required this.onSubmit,
  }) : super(key: key);

  final void Function(String newName) onSubmit;

  final String currentName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current name: $currentName'),
        MaterialButton(
          onPressed: () {
            // Add validation, etc.
            onSubmit('Aegon Targaryen');
          },
        )
      ],
    );
  }
}
