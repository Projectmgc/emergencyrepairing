import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedPageIndex = 0;

  // List of pages to navigate
  final List<Widget> _pages = [
    HomeScreen(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  // Function to navigate to a selected page
  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor:
            const Color.fromARGB(206, 186, 112, 26), // Custom hex color
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with Avatar
            const UserAccountsDrawerHeader(
              accountName: Text('User Name', style: TextStyle(fontSize: 18)),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/avatar.png'), // Use your image here
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            // Drawer Menu Items
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home'),
              onTap: () => _onSelectPage(0),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Profile'),
              onTap: () => _onSelectPage(1),
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () => _onSelectPage(2),
            ),
            // Divider for separation
            const Divider(),
            // Help and Logout options
            ListTile(
              leading: const Icon(Icons.help, color: Colors.black),
              title: const Text('About Help'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add Help Screen or About Page here if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.black),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add logout logic here
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page', style: TextStyle(fontSize: 24)),
    );
  }
}

// Settings Page
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Page', style: TextStyle(fontSize: 24)),
    );
  }
}
