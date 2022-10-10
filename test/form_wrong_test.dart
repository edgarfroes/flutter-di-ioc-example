// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioc_example/example_1/form.dart';

void main() {
  testWidgets(
    'Wrong Form Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Form1(
            userId: '123',
          ),
        ),
      );

      // Can fail when the DB Service don't have connection to the database
      // to retrieve the user or to update the user name.
      // If it has connection to the DB (E2E test), it'll take long time to
      // retrieve data, or fail of the DB isn't available, since it's an
      // external dependency.
      // Also, it can take a long time to run since it's connecting to the DB.
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MaterialButton));

      // If it gets to this point without failing, it can fail again when trying
      // to save data to the DB for the same reason.
      await tester.pumpAndSettle();

      // If it succeeds, it will be a false positive, as it can fail at any
      // time on next test calls.
    },
  );
}
