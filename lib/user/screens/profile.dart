import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isEditing = false; // Track if we're in editing mode
  final _formKey = GlobalKey<FormState>(); // Key to manage form validation

  // Function to toggle editing mode
  void toggleEditingMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  // Handle save button press
  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      // Logic for saving the profile
      setState(() {
        isEditing = false; // Stop editing after save
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile saved successfully!'),
        backgroundColor: Colors.green,
      ));
    } else {
      // Show error message if form is invalid
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fill in all the required fields.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  // Handle cancel button press
  void _handleCancel() {
    // Reset fields and stop editing
    setState(() {
      isEditing = false;
      usernameController.clear();
      passwordController.clear();
      phoneNumberController.clear();
      emailController.clear();
      addressController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Changes canceled.'),
      backgroundColor: Colors.grey,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow to make the title stand out better
        backgroundColor: Colors.transparent, // Make AppBar transparent
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Title at the top center
            Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 19, 20, 44),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/profile_placeholder.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle profile picture update
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Fields with Form Validation
            Form(
              key: _formKey, // Attach form key for validation
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: isEditing
                    ? Column(
                        children: [
                          // Username Field (Editable with validation)
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),

                          // Password Field (Editable with validation)
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),

                          // Phone Number Field (Editable with validation)
                          TextFormField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              // Regex for phone number validation (simple 10 digit validation)
                              String pattern = r'^[0-9]{10}$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value)) {
                                return 'Please enter a valid 10-digit phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),

                          // Email Field (Editable with validation)
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),

                          // Address Field (Editable with validation)
                          TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.home),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                        ],
                      )
                    : Column(
                        children: [
                          // Displaying Non-editable Profile Information
                          Row(
                            children: [
                              Icon(Icons.person, size: 30),
                              SizedBox(width: 10),
                              Text(
                                usernameController.text.isEmpty
                                    ? 'Username'
                                    : usernameController.text,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Icon(Icons.phone, size: 30),
                              SizedBox(width: 10),
                              Text(
                                phoneNumberController.text.isEmpty
                                    ? 'Phone Number'
                                    : phoneNumberController.text,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Icon(Icons.email, size: 30),
                              SizedBox(width: 10),
                              Text(
                                emailController.text.isEmpty
                                    ? 'Email'
                                    : emailController.text,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Icon(Icons.home, size: 30),
                              SizedBox(width: 10),
                              Text(
                                addressController.text.isEmpty
                                    ? 'Address'
                                    : addressController.text,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
              ),
            ),

            // Save and Cancel Buttons (Only visible when editing)
            if (isEditing)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _handleSave,
                    child: Text('Save'),
                  ),
                  OutlinedButton(
                    onPressed: _handleCancel,
                    child: Text('Cancel'),
                  ),
                ],
              ),
            SizedBox(height: 30),

            // Edit Button at the bottom
            Center(
              child: ElevatedButton(
                onPressed: toggleEditingMode,
                child: Text(isEditing ? 'Stop Editing' : 'Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
