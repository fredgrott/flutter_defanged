// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.








import 'package:flutter/material.dart';
import 'package:flutter_defanged/app/modules/myapp/views/my_app.dart';





import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';


void main() {
  // docs correction, it needs to go immediately first
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // ignore: no-empty-block
  setUpAll(() async {
    //IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  });


  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {});


  group('Basic Simple Unit Test', () {
    // use runAsync when yu have calls to such things as Future.delayed in the testWidgets
    testWidgets("Integration Counter increments smoke test", (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      
      await tester.tap(find.byWidgetPredicate((widget) => widget is IconButton));
      // only use pumpAndSettle() when you really do not know how many frames
      // otherwise use tester.pump() and define the number of microseconds
      await tester.pumpAndSettle();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('validate appbar widget', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      find.ancestor(of: find.byType(AppBar), matching: find.text('Flutter Defanged'));
    });


  });
}
