import 'package:flutter/material.dart';
import 'package:flutter_application_1/owner/payments.dart';
import 'package:flutter_application_1/owner/screens/fuel%20_request.dart';
import 'package:flutter_application_1/owner/screens/repairrequests.dart';
import 'package:flutter_application_1/user/screens/introduction.dart';

class ServiceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Dashboard',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 160, 128, 39),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, size: 30),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out!')),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => IntroductionPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 202, 113, 36),
              const Color.fromARGB(255, 4, 163, 34)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildMenuTile(
                context,
                'Profile',
                'Update your details',
                Icons.person,
                ProfilePage(),
              ),
              _buildMenuTile(
                context,
                'Fuel Requests',
                'Manage fuel services',
                Icons.local_gas_station,
                FuelFillingRequest(),
              ),
              _buildMenuTile(
                context,
                'Emergency Repairs',
                'Handle urgent repairs',
                Icons.build,
                EmergencyRepairRequest(),
              ),
              _buildMenuTile(
                context,
                'Payments & Earnings',
                'Track earnings and payments',
                Icons.account_balance_wallet,
                PaymentsAndEarningsPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTile(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Widget page,
  ) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.deepPurple,
              ),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy Pages for Navigation

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text('Profile Details Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class FuelFillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Requests'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:
            Text('Fuel Filling Requests Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class EmergencyRepairRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Repair Requests'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text('Emergency Repair Requests Page',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments & Earnings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:
            Text('Payments and Earnings Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
