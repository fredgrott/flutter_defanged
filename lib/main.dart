import 'package:flutter/material.dart';
import 'package:flutter_defanged/app/modules/myapp/views/my_app.dart';

// Note: This is the Google Flutter UI-Kit Way of
//       getting you to practice bad habits on the way
//       to mastering Flutter Widgets.
//
//       DO NOT DO THIS! Read the Readme and follow the
//       gist of the articles listed and the branches
//       beyond this master branch.
//
//  Wrong Techniques:
//  1.  Mixing Model and Biz Logic in Configuring Internal state of the
//      widget(view-state, very different from app-state).
//  2.  Not modularizing into components such as main, appsplash, and homepage.
//  3.  No zone capturing of app exceptions.
//  4.  no concrete logging strategy to transform uncaught exceptions into
//      caught and handled exceptions in the development process.
//  5.  no cross-platform UI polish, even have a material-only-fab in the UI!
//  6.  In mobile, the somewhat market-place standard is for a background imagery
//      to brand and transparent or semi-transparent appbar; and this has neither.
//  7.  No project semi-automatic workflow setup.
//  8.  No custom lint strategy to reduce pain of migrating to upstream dart computer language versions.
//  9.  No integrated instrumented testing set-up.
//  10. no goldens testing setup.
//  11. no configuration of widget testing setup.
//  12. No clear architecture setup in the lib folder.


void main() {

  // When initializing main one has to account for the delays in booting all parts of
  // the flutter Sky-engine which embeds the flutter app in ios, android, and desktop targets.
  // That requires this line, which should be towards the last part of the main function.
  // The same line is used in our testing to make sure the Flutter Sky engine is fully 
  // booted before instrumented tests run for example.
  WidgetsFlutterBinding.ensureInitialized();





  runApp(MyApp());
}



