import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Define a GlobalKey to manage the Scaffold state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      body: Center(
        child: Stack(
          children: [
            // First Box with Gradient and Text
            Align(
              alignment: Alignment(-0.7, -0.4),
              child: GestureDetector(
                onTap: () {
                  // Add navigation or other actions here
                },
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4B5B69), Color(0xFF344139)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(25), // Increased corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(6, 8), // Adjusted shadow for depth
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_gas_station, // Icon for Fuel
                          color: Colors.white,
                          size: 35, // Slightly larger icon
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Fuel',
                          style: TextStyle(
                            fontSize: 20, // Increased font size
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
              ),
            ),
            // Second Box with Gradient and Text
            Align(
              alignment: Alignment(0.7, -0.4),
              child: GestureDetector(
                onTap: () {
                  // Add navigation or other actions here
                },
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFA17471), Color(0xFF7A4A42)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(25), // Increased corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(6, 8), // Adjusted shadow for depth
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.build,
                          color: Colors.white,
                          size: 35, // Slightly larger icon
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Repair services',
                          style: TextStyle(
                            fontSize: 20, // Increased font size
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
              ),
            ),
            // Third Box with Gradient and Text
            Align(
              alignment: Alignment(-0.7, 0.4),
              child: GestureDetector(
                onTap: () {
                  // Add navigation or other actions here
                },
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2F4D30), Color(0xFF7C4848)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(25), // Increased corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(6, 8), // Adjusted shadow for depth
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.drive_eta,
                          color: Colors.white,
                          size: 35, // Slightly larger icon
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Tow services',
                          style: TextStyle(
                            fontSize: 20, // Increased font size
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
              ),
            ),
            // Fourth Box with Gradient and Text
            Align(
              alignment: Alignment(0.7, 0.4),
              child: GestureDetector(
                onTap: () {
                  // Add navigation or other actions here
                },
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFAC8B5A), Color(0xFF785936)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.circular(25), // Increased corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(6, 8), // Adjusted shadow for depth
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 35, // Slightly larger icon
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 20, // Increased font size
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
