import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/introduction.dart';

class ServiceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out!')),
              );
              // Navigate to the Login screen (or any screen you prefer)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => IntroductionPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildWelcomeText(),
            SizedBox(height: 20),
            _buildMenuTile(context, 'Manage Profile', ProfilePage()),
            _buildMenuTile(context, 'Fuel Filling Requests', FuelFillingPage()),
            _buildMenuTile(
                context, 'Emergency Repair Requests', EmergencyRepairPage()),
            _buildMenuTile(context, 'Payments & Earnings', PaymentsPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Center(
      child: Text(
        'Welcome to the Vehicle Service Dashboard!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 246, 150, 94),
        ),
      ),
    );
  }

  Widget _buildMenuTile(BuildContext context, String title, Widget page) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward,
            color: const Color.fromARGB(255, 219, 44, 17)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Form key to manage the form validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for the text fields
  final _nameController = TextEditingController();
  final _businessController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  // Validator functions
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _validateBusinessName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your business name';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegExp = RegExp(r'^\+?1?\d{9,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // Wrap fields in Form widget to enable validation
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_nameController, 'Name', _validateName),
              SizedBox(height: 10),
              _buildTextField(
                  _businessController, 'Business Name', _validateBusinessName),
              SizedBox(height: 10),
              _buildTextField(_phoneController, 'Phone Number', _validatePhone),
              SizedBox(height: 10),
              _buildTextField(_emailController, 'Email', _validateEmail),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate all fields before submitting
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profile updated successfully!")),
                    );
                  } else {
                    // If the form is invalid, show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("Please correct the errors in the form")),
                    );
                  }
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextFormField with validator attached
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String? Function(String?)? validator, // Accepts validator
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator, // Attach the validator
      ),
    );
  }
}

// Fuel Filling Requests Page
class FuelFillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel Filling Requests'),
      ),
      body: ListView(
        children: [
          _buildRequestCard('AUDI', 'Raju', 'Fuel Request 1'),
          _buildRequestCard('SUV', 'Rocky', 'Fuel Request 2'),
        ],
      ),
    );
  }

  Widget _buildRequestCard(String vehicle, String client, String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text('$title: $vehicle'),
        subtitle: Text('Client: $client'),
        trailing: ElevatedButton(
          onPressed: () {
            // Accept Fuel Filling Request
          },
          child: Text('Accept'),
        ),
      ),
    );
  }
}

// Emergency Repair Requests Page
class EmergencyRepairPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Repair Requests'),
      ),
      body: ListView(
        children: [
          _buildRepairRequestCard('Flat Tire', 'Raju', 'Repair Request 1'),
          _buildRepairRequestCard(
              'Engine Problem', 'Rocky', 'Repair Request 2'),
        ],
      ),
    );
  }

  Widget _buildRepairRequestCard(String issue, String client, String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text('$title: $issue'),
        subtitle: Text('Client: $client'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Accept Repair Request
              },
              child: Text('Accept'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Reject Repair Request
              },
              child: Text('Reject'),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Requests'),
      ),
      body: ListView(
        children: [
          // Tire Replacement Requests Section
          _buildServiceRequestSection('Tire Replacement Requests', [
            _buildServiceRequestCard('Tire Change', 'Raju', 'Tire Request 1'),
            _buildServiceRequestCard('Tire Change', 'Rocky', 'Tire Request 2'),
          ]),
          // Oil Change Requests Section
          _buildServiceRequestSection('Oil Change Requests', [
            _buildServiceRequestCard('Oil Change', 'Sam', 'Oil Request 1'),
            _buildServiceRequestCard('Oil Change', 'Alex', 'Oil Request 2'),
          ]),
        ],
      ),
    );
  }

  // Builds each service request section (Tire Replacement / Oil Change)
  Widget _buildServiceRequestSection(
      String sectionTitle, List<Widget> requests) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            sectionTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ...requests,
      ],
    );
  }

  // Builds each service request card
  Widget _buildServiceRequestCard(String service, String client, String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text('$title: $service'),
        subtitle: Text('Client: $client'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Accept Service Request
              },
              child: Text('Accept'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Reject Service Request
              },
              child: Text('Reject'),
            ),
          ],
        ),
      ),
    );
  }
}

// Payments & Earnings Page
class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments & Earnings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Earnings Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Total Earnings: \$1200'),
            SizedBox(height: 20),
            Text('Pending Payments: \$300'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to payment details page
              },
              child: Text('View Payment History'),
            ),
          ],
        ),
      ),
    );
  }
}
