import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/fuel.dart';
import 'package:flutter_application_1/user/screens/repair.dart';
import 'package:flutter_application_1/user/screens/tow.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOptionBox(
                  context: context,
                  title: 'Fuel',
                  icon: Icons.local_gas_station,
                  colors: [
                    Color.fromARGB(255, 218, 80, 30),
                    Color.fromARGB(255, 162, 182, 44)
                  ],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FuelStationApp()),
                    );
                  },
                ),
                buildOptionBox(
                  context: context,
                  title: 'Repair Services',
                  icon: Icons.build,
                  colors: [
                    Color.fromARGB(255, 196, 106, 16),
                    Color.fromARGB(197, 8, 12, 9)
                  ],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VehicleRepairApp()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30), // Space between rows
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOptionBox(
                  context: context,
                  title: 'Tow Services',
                  icon: Icons.drive_eta,
                  colors: [
                    Color.fromARGB(255, 32, 153, 36),
                    Color.fromARGB(255, 119, 22, 36)
                  ],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TowingServiceApp()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionBox({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: Offset(6, 8),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
