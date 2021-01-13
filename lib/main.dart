import 'package:flutter/material.dart';
import 'package:flutter_nusantech/locator.dart';
import 'package:flutter_nusantech/shared/Theme.dart';
import 'package:flutter_nusantech/view/Calculator.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
          GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          inputDecorationTheme: themeInput
      ),
      home: Calculator()
    );
  }
}
