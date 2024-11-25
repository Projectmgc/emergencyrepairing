import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/about.dart';
import 'package:flutter_application_1/user/screens/history.dart';
import 'package:flutter_application_1/user/screens/home_screen.dart';
import 'package:flutter_application_1/user/screens/login_screen.dart';
import 'package:flutter_application_1/user/screens/profile.dart';
import 'package:flutter_application_1/user/screens/setting.dart';

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
    ProfilePage(),
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
        title: const Text(
          'Welcome to Fuel & Fix App',
          style: TextStyle(
              fontWeight: FontWeight.bold, // Makes the title bold
              fontSize: 24, // Custom font size
              letterSpacing: 1.2, // Adds space between the letters
              fontFamily: 'Roboto',
              color: Color.fromARGB(255, 249, 239,
                  235) // Sets a custom font family (you can choose your own)
              ),
        ),

        backgroundColor: Colors.transparent, // Makes background transparent
        centerTitle: true,

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(
                    255, 255, 174, 0), // first color (example yellow)

                Color.fromARGB(255, 135, 18, 31), // second color
              ],
            ),
          ),
        ), // This centers the title within the app bar
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
                color: Color.fromARGB(255, 173, 167, 117),
              ),
            ),
            // Drawer Menu Items
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.black),
              title: const Text('History'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserHistoryPage()));
              },
            ),
            // Divider for separation
            const Divider(),
            // Help and Logout options
            ListTile(
              leading: const Icon(Icons.help, color: Colors.black),
              title: const Text('About Help'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AboutHelpPage())); // Close the drawer
                // Add Help Screen or About Page here if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.black),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen())); // Close the drawer
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
