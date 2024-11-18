import 'package:flutter/material.dart';
import 'package:flutter_application_1/owner/screens/owner_login.dart';
import 'package:flutter_application_1/user/screens/login_screen.dart';
import 'package:flutter_application_1/admin/screens/admin_login.dart';
// Import Service Provider Page

void main() {
  runApp(FuelManagementSystemApp());
}

class FuelManagementSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroductionPage(),
    );
  }
}

// Home Page
class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Management System'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Fuel Management System',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: const Text('Admin Login'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('User Portal'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceProviderLoginPage()),
                );
              },
              child: const Text('Service Providers'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Service Provider Page
class ServiceProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider Portal'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: const Text(
          'Welcome to the Service Provider Portal!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
