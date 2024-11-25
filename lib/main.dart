import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/screens/feedback.dart';
import 'package:flutter_application_1/admin/screens/manage_users.dart';
import 'package:flutter_application_1/admin/screens/admin_home.dart';
import 'package:flutter_application_1/admin/screens/manage_fuel.dart';
import 'package:flutter_application_1/admin/screens/manage_mecahnics.dart';
import 'package:flutter_application_1/admin/screens/reports.dart';
import 'package:flutter_application_1/admin/screens/transaction.dart';
import 'package:flutter_application_1/owner/payments.dart';
import 'package:flutter_application_1/owner/screens/fuel%20_request.dart';
import 'package:flutter_application_1/owner/screens/owner_home.dart';
import 'package:flutter_application_1/owner/screens/owner_login.dart';
import 'package:flutter_application_1/owner/screens/repairrequests.dart';
import 'package:flutter_application_1/user/screens/history.dart';
import 'package:flutter_application_1/user/screens/introduction.dart';
import 'package:flutter_application_1/user/screens/navigation.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Navigation()));
}
