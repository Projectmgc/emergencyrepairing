import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/screens/navigation.dart';
import 'package:flutter_application_1/user/screens/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Variable to manage password visibility
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img2.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.85,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: const Color.fromARGB(255, 66, 63, 63),
                    child: Icon(
                      Icons.person,
                      size: 60.0,
                      color: const Color.fromARGB(255, 197, 207, 211),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: const Color.fromARGB(255, 0, 5, 26),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: usernameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible, // Toggle visibility
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Navigation()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                      shadowColor: const Color.fromARGB(255, 16, 9, 112),
                    ),
                    child: Text('Sign in'),
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
