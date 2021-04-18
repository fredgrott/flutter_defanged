// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';


// This is a simple app title test copied and modified from
// the Chromium project and the flutter projects.
// It has not yet been ported to null-safety but I have noted what needs
// to change to make it null-safe

const Color kTitleColor = Color(0xFF333333);
const String kTitleString = 'Flutter Defanged';
// note I do not have null safety here as of yet
// null safe-wise this should be:
//  GenerateAppTitle? onGenerateTitle
Future<void> pumpApp(WidgetTester tester,
    // ignore: prefer-trailing-comma
    {GenerateAppTitle onGenerateTitle}) async {
  await tester.pumpWidget(
    WidgetsApp(
      // ignore: avoid_redundant_argument_values
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
      ],
      title: kTitleString,
      color: kTitleColor,
      onGenerateTitle: onGenerateTitle,
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder<void>(
            // ignore: prefer-trailing-comma
            pageBuilder: (BuildContext context, Animation<double> animation,
                // ignore: prefer-trailing-comma
                Animation<double> secondaryAnimation) {
          return Container();
        });
      },
    ),
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: no-empty-block
  setUpAll(() async {});

  // ignore: no-empty-block
  tearDownAll(() async {});

  // ignore: no-empty-block
  tearDown(() async {});

  group('Basic App Chrome Title test', () {
    testWidgets('Specified title and color are used to build a Title',
        // ignore: prefer-trailing-comma
        (WidgetTester tester) async {
      await pumpApp(tester);
      expect(tester.widget<Title>(find.byType(Title)).title, kTitleString);
      expect(tester.widget<Title>(find.byType(Title)).color, kTitleColor);
    });

    testWidgets('onGenerateTitle handles changing locales',
        // ignore: prefer-trailing-comma
        (WidgetTester tester) async {
      String generateTitle(BuildContext context) {
        return Localizations.localeOf(context).toString();
      }

      await pumpApp(tester, onGenerateTitle: generateTitle);
      expect(tester.widget<Title>(find.byType(Title)).title, 'en_US');
      expect(tester.widget<Title>(find.byType(Title)).color, kTitleColor);

      // Not a supported locale, so we switch to supportedLocales[0], en_US
      await tester.binding.setLocale('fr', 'CA');
      await tester.pump();
      expect(tester.widget<Title>(find.byType(Title)).title, 'en_US');
      expect(tester.widget<Title>(find.byType(Title)).color, kTitleColor);
    });
    
  });
}
