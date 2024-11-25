import 'package:flutter/material.dart';
import 'package:flutter_application_1/owner/screens/owner_home.dart';
import 'package:flutter_application_1/owner/screens/owner_login.dart';
import 'package:flutter_application_1/user/screens/login_screen.dart';
// Import Service Provider Page

// Home Page
class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 137, 127),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img2.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('asset/car1.jpg'),
                radius: 70, // Adjust the size of the image as needed
              ),
              SizedBox(height: 50),
              const Text(
                'Welcome to the Fuel & Fix Assist System',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 83, 6, 83)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              /* ElevatedButton(
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
            ),*/
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
      ),
    );
  }
}

// Service Provider Page
/*class ServiceProviderPage extends StatelessWidget {
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
}*/
