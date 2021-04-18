// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Modified, as Google has some bad habits in their example that I do not 
// want you guys and gals to emulate or pick up!

import 'package:flutter/material.dart';
import 'package:flutter_defanged/app/modules/myapp/views/my_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // we need to make sure the Flutter Sky-Engine is fully booted first
  WidgetsFlutterBinding.ensureInitialized();

  // one, should group the setup and teardown setup

  // ignore: no-empty-block
  setUpAll(() async {});

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async{});


  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
