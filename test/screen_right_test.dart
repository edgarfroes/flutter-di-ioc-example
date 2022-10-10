// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioc_example/models/user.dart';
import 'package:ioc_example/example_2/screen.dart';
import 'package:ioc_example/services/user_database_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'screen_right_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserDatabaseService>()])
void main() {
  const userId = '123';
  const oldUserName = 'name';
  const newUserName = 'Aegon Targaryen';
  final mockService = MockUserDatabaseService();
  final mockUser = User(
    id: userId,
    name: oldUserName,
  );

  testWidgets(
    'Right Screen Test',
    (WidgetTester tester) async {
      when(mockService.get(userId: userId)).thenReturn(mockUser);

      await tester.pumpWidget(
        MaterialApp(
          home: Screen2(
            userId: userId,
            dbService: mockService,
          ),
        ),
      );

      await tester.pumpAndSettle();

      verify(mockService.get(userId: userId)).called(1);

      verifyNever(
        mockService.saveUserName(
          id: userId,
          name: newUserName,
        ),
      );

      await tester.tap(find.byType(MaterialButton));

      await tester.pumpAndSettle();

      verify(mockService.saveUserName(
        id: userId,
        name: newUserName,
      )).called(1);
    },
  );
}
