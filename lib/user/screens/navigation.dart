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
    UserHistoryPage(),
    AboutHelpPage(), // Assuming AboutHelpPage exists
  ];

  // Function to navigate to a selected page
  void _onSelectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
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
              color: Color.fromARGB(255, 249, 239, 235) // Custom font color
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
                Color.fromARGB(255, 255, 174, 0), // first color (yellow)
                Color.fromARGB(255, 135, 18, 31), // second color
              ],
            ),
          ),
        ),
      ),
      body: _pages[_selectedPageIndex], // Displays selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _onSelectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'About/Help',
          ),
        ],
        backgroundColor: Colors.white, // Solid color for the bottom bar
        selectedItemColor: Colors.orange, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
      ),
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

// History Page
class UserHistoryPage extends StatelessWidget {
  const UserHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History Page', style: TextStyle(fontSize: 24)),
    );
  }
}

// About/Help Page
class AboutHelpPage extends StatelessWidget {
  const AboutHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('About / Help Page', style: TextStyle(fontSize: 24)),
    );
  }
}
