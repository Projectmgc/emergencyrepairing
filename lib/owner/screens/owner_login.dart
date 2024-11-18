import 'package:flutter/material.dart';

void main() {
  runApp(ServiceProviderApp());
}

class ServiceProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Provider Login',
      home: ServiceProviderLoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ServiceProviderLoginPage extends StatefulWidget {
  @override
  _ServiceProviderLoginPageState createState() =>
      _ServiceProviderLoginPageState();
}

class _ServiceProviderLoginPageState extends State<ServiceProviderLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _loginServiceProvider() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Dummy service provider credentials (Replace with actual backend authentication)
      if (email == "provider@example.com" && password == "provider123") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceProviderDashboard()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid email or password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Service Provider Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loginServiceProvider,
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to a Forgot Password page if implemented
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Forgot Password feature not implemented"),
                    ),
                  );
                },
                child: Text('Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Welcome to the Service Provider Dashboard!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
