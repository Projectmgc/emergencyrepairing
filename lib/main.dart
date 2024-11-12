import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Register(),
      debugShowCheckedModeBanner: false, // Optional: hides the debug banner
    );
  }
}
