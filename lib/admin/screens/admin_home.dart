import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Admin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildDashboardCard(
                  title: 'Manage Users',
                  icon: Icons.people,
                  onTap: () {
                    // Navigate to manage users page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PlaceholderPage(title: 'Manage Users')),
                    );
                  },
                ),
                _buildDashboardCard(
                  title: 'Reports',
                  icon: Icons.bar_chart,
                  onTap: () {
                    // Navigate to reports page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PlaceholderPage(title: 'Reports')),
                    );
                  },
                ),
                _buildDashboardCard(
                  title: 'Fuel Management',
                  icon: Icons.local_gas_station,
                  onTap: () {
                    // Navigate to fuel management page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PlaceholderPage(title: 'Fuel Management')),
                    );
                  },
                ),
                _buildDashboardCard(
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    // Navigate to settings page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PlaceholderPage(title: 'Settings')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation for bottom navigation bar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on index: $index')),
          );
        },
      ),*/
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title Page',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
