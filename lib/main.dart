import 'package:flutter/material.dart';
import 'package:grocery_flutter/screen/GrocerySplash.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: GrocerySplashScreen(),
    );
  }
}
