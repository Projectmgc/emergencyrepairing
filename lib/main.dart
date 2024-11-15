import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/home_screen.dart';
import 'package:flutter_application_1/user/screens/login_screen.dart';
import 'package:flutter_application_1/user/screens/navigation.dart';
import 'package:flutter_application_1/user/screens/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Navigation()
    )
  );
}
