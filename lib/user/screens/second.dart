import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VehicleRegistrationPage(),
    );
  }
}

class VehicleRegistrationPage extends StatefulWidget {
  const VehicleRegistrationPage({Key? key}) : super(key: key);

  @override
  _VehicleRegistrationPageState createState() =>
      _VehicleRegistrationPageState();
}

class _VehicleRegistrationPageState extends State<VehicleRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Set a light background color
      body: Center(
        // Center the form on the screen
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Minimize space, center items vertically
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),

                  // Title placed just above the form fields
                  const Text(
                    'Please Register Your Vehicle',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Vehicle Type Input
                  TextFormField(
                    controller: _vehicleTypeController,
                    decoration: const InputDecoration(
                      labelText: 'Vehicle Type',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.directions_car), // Vehicle icon
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a vehicle type';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Registration Number Input
                  TextFormField(
                    controller: _registrationController,
                    decoration: const InputDecoration(
                      labelText: 'Registration Number',
                      border: OutlineInputBorder(),
                      prefixIcon:
                          Icon(Icons.confirmation_number), // Registration icon
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a registration number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Location Input
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on), // Location icon
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Register Button with normal size
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // If the form is valid, show a Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Vehicle Registered!')),
                        );
                      }
                    },
                    child: const Text('Register'),
                    style: ElevatedButton.styleFrom(
                      elevation: 10, // Shadow depth
                      shadowColor: const Color.fromARGB(255, 0, 0, 0)
                          .withOpacity(0.9), // Shadow color and opacity
                      textStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
