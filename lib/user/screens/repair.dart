import 'package:flutter/material.dart';

void main() {
  runApp(VehicleRepairApp());
}

class VehicleRepairApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VehicleRepairCategories(),
    );
  }
}

class VehicleRepairCategories extends StatefulWidget {
  @override
  _VehicleRepairCategoriesState createState() =>
      _VehicleRepairCategoriesState();
}

class _VehicleRepairCategoriesState extends State<VehicleRepairCategories> {
  String _enteredLocation = ''; // Variable to store user entered location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Repair Services'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field for user to enter their location
            TextField(
              onChanged: (text) {
                setState(() {
                  _enteredLocation = text;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on, color: Colors.blueAccent),
                labelText: 'Enter Location (e.g. Location A)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to proceed after entering the location
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_enteredLocation.isEmpty) {
                    // Show a warning if the location is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid location.')),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkshopListScreen(
                          location: _enteredLocation.toLowerCase(),
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.search, size: 20),
                label: Text('Show Workshops'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to show all workshops
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowAllWorkshopsScreen(),
                    ),
                  );
                },
                child: Text('Show All Workshops'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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

class WorkshopListScreen extends StatelessWidget {
  final String location;

  WorkshopListScreen({required this.location});

  // Define workshops based on location
  List<Map<String, dynamic>> _getWorkshops(String location) {
    var workshops = {
      'location a': [
        {
          'name': 'AutoCare Service Center',
          'address': '123 Main St, Location A',
          'contact': '+1 800-123-4567',
          'description': 'A full-service auto repair center.',
          'working_hours': 'Mon-Sat: 9 AM - 7 PM',
          'rating': 4.5,
          'vehicle_types': ['Cars', 'Motorcycles'],
          'promotions': '10% off on first visit!',
          'services': ['Battery Replacement', 'Tyre Repair', 'Engine Checkup'],
        },
        {
          'name': 'FastFix Workshop',
          'address': '456 Elm St, Location A',
          'contact': '+1 800-789-1234',
          'description': 'Fast and reliable repair services.',
          'working_hours': 'Mon-Fri: 9 AM - 6 PM',
          'rating': 4.0,
          'vehicle_types': ['Cars'],
          'promotions': 'Free battery checkup with any service!',
          'services': ['Brake Repair', 'AC Checkup', 'Oil Change'],
        },
      ],
      'location b': [
        {
          'name': 'QuickFix Car Services',
          'address': '789 Oak St, Location B',
          'contact': '+1 800-111-2222',
          'description': 'Quick and reliable car services.',
          'working_hours': 'Mon-Sun: 8 AM - 8 PM',
          'rating': 4.7,
          'vehicle_types': ['Cars'],
          'promotions': '15% off on air conditioning repair!',
          'services': ['Tyre Alignment', 'AC Gas Refill', 'Battery Check'],
        },
      ],
      'location c': [
        {
          'name': 'WheelMasters',
          'address': '321 Pine St, Location C',
          'contact': '+1 800-333-4444',
          'description': 'Expert wheel and brake services.',
          'working_hours': 'Mon-Sat: 10 AM - 6 PM',
          'rating': 4.8,
          'vehicle_types': ['Cars', 'Motorcycles'],
          'promotions': '20% off on brake services!',
          'services': ['Brake Pad Replacement', 'Engine Diagnostics'],
        },
      ],
    };

    return workshops[location] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final availableWorkshops = _getWorkshops(location);

    return Scaffold(
      appBar: AppBar(
        title: Text('Workshops in $location'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: availableWorkshops.isEmpty
          ? Center(child: Text('No workshops found for this location.'))
          : ListView.builder(
              itemCount: availableWorkshops.length,
              itemBuilder: (context, index) {
                final workshop = availableWorkshops[index];

                return Card(
                  margin: EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Workshop Name
                        Text(
                          workshop['name'],
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        // Address
                        Text(
                          'Address: ${workshop['address']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        // Contact
                        Text(
                          'Contact: ${workshop['contact']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        // Description
                        Text(
                          'Description: ${workshop['description']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        // Working Hours
                        Text(
                          'Working Hours: ${workshop['working_hours']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        // Rating
                        Text(
                          'Rating: ${workshop['rating']} ★',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        // Vehicle Types
                        Text(
                          'Vehicle Types Serviced: ${workshop['vehicle_types'].join(', ')}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        // Promotions
                        Text(
                          'Promotions: ${workshop['promotions']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 15),
                        // Button to navigate to details screen
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkshopDetailScreen(
                                  workshop: workshop,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('Show More Details'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ShowAllWorkshopsScreen extends StatelessWidget {
  // A function that returns all available workshops regardless of location
  List<Map<String, dynamic>> _getAllWorkshops() {
    return [
      {
        'name': 'AutoCare Service Center',
        'address': '123 Main St, Location A',
        'contact': '+1 800-123-4567',
        'description': 'A full-service auto repair center.',
        'working_hours': 'Mon-Sat: 9 AM - 7 PM',
        'rating': 4.5,
        'vehicle_types': ['Cars', 'Motorcycles'],
        'promotions': '10% off on first visit!',
        'services': ['Battery Replacement', 'Tyre Repair', 'Engine Checkup'],
      },
      {
        'name': 'FastFix Workshop',
        'address': '456 Elm St, Location A',
        'contact': '+1 800-789-1234',
        'description': 'Fast and reliable repair services.',
        'working_hours': 'Mon-Fri: 9 AM - 6 PM',
        'rating': 4.0,
        'vehicle_types': ['Cars'],
        'promotions': 'Free battery checkup with any service!',
        'services': ['Brake Repair', 'AC Checkup', 'Oil Change'],
      },
      {
        'name': 'QuickFix Car Services',
        'address': '789 Oak St, Location B',
        'contact': '+1 800-111-2222',
        'description': 'Quick and reliable car services.',
        'working_hours': 'Mon-Sun: 8 AM - 8 PM',
        'rating': 4.7,
        'vehicle_types': ['Cars'],
        'promotions': '15% off on air conditioning repair!',
        'services': ['Tyre Alignment', 'AC Gas Refill', 'Battery Check'],
      },
      {
        'name': 'WheelMasters',
        'address': '321 Pine St, Location C',
        'contact': '+1 800-333-4444',
        'description': 'Expert wheel and brake services.',
        'working_hours': 'Mon-Sat: 10 AM - 6 PM',
        'rating': 4.8,
        'vehicle_types': ['Cars', 'Motorcycles'],
        'promotions': '20% off on brake services!',
        'services': ['Brake Pad Replacement', 'Engine Diagnostics'],
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final allWorkshops = _getAllWorkshops();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Workshops'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: allWorkshops.length,
        itemBuilder: (context, index) {
          final workshop = allWorkshops[index];

          return Card(
            margin: EdgeInsets.all(12),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Workshop Name
                  Text(
                    workshop['name'],
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // Address
                  Text(
                    'Address: ${workshop['address']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  // Contact
                  Text(
                    'Contact: ${workshop['contact']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  // Button to navigate to the details screen
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkshopDetailScreen(
                            workshop: workshop,
                          ),
                        ),
                      );
                    },
                    child: Text('Show More Details'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WorkshopDetailScreen extends StatelessWidget {
  final Map<String, dynamic> workshop;

  WorkshopDetailScreen({required this.workshop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workshop['name']),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Name: ${workshop['name']}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Address: ${workshop['address']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Contact: ${workshop['contact']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${workshop['description']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Working Hours: ${workshop['working_hours']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: ${workshop['rating']} ★',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Services: ${workshop['services'].join(', ')}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Vehicle Types Serviced: ${workshop['vehicle_types'].join(', ')}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Promotions: ${workshop['promotions']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
