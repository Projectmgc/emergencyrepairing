import 'package:flutter/material.dart';

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

class VehicleRepairCategories extends StatelessWidget {
  final List<String> categories = [
    'Battery Service',
    'Tyre Service',
    'Engine Service',
    'AC Service',
    'Brake Service',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Repair Services'),
        centerTitle: true,
        // No actions, search icon, etc.
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: _getCategoryIcon(category),
              title: Text(
                category,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ServiceDetailsScreen(category: category),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Icon _getCategoryIcon(String category) {
    switch (category) {
      case 'Battery Service':
        return Icon(Icons.battery_charging_full, color: Colors.orange);
      case 'Tyre Service':
        return Icon(Icons.car_repair, color: Colors.blue);
      case 'Engine Service':
        return Icon(Icons.build, color: Colors.green);
      case 'AC Service':
        return Icon(Icons.ac_unit, color: Colors.cyan);
      case 'Brake Service':
        return Icon(Icons.directions_car, color: Colors.red);
      default:
        return Icon(Icons.build);
    }
  }
}

class ServiceDetailsScreen extends StatelessWidget {
  final String category;
  ServiceDetailsScreen({required this.category});

  List<Map<String, dynamic>> _getServiceStations(String category) {
    switch (category) {
      case 'Battery Service':
        return [
          {
            'name': 'AutoCare Service Center',
            'services': {
              'Battery Check': 500.0,
              'Battery Replacement': 2000.0,
            },
          },
          {
            'name': 'QuickFix Center',
            'services': {
              'Battery Check': 600.0,
              'Battery Replacement': 2200.0,
            },
          }
        ];
      case 'Tyre Service':
        return [
          {
            'name': 'WheelWorks Repair Hub',
            'services': {
              'Tyre Replacement': 1500.0,
              'Tyre Repair': 800.0,
            },
          },
          {
            'name': 'Speedy Repairs',
            'services': {
              'Tyre Replacement': 1800.0,
              'Tyre Alignment': 1200.0,
            },
          }
        ];
      case 'Engine Service':
        return [
          {
            'name': 'Engine Masters',
            'services': {
              'Engine Diagnostics': 1500.0,
              'Engine Overhaul': 5000.0,
            },
          },
          {
            'name': 'CarFix Engine Services',
            'services': {
              'Oil Change': 700.0,
              'Engine Repair': 3500.0,
            },
          }
        ];
      case 'AC Service':
        return [
          {
            'name': 'CoolAir Repair Hub',
            'services': {
              'AC Checkup': 800.0,
              'AC Gas Refill': 1500.0,
              'AC Filter Replacement': 1000.0,
            },
          },
          {
            'name': 'QuickCool AC Services',
            'services': {
              'AC Gas Refill': 1400.0,
              'AC Filter Cleaning': 800.0,
            },
          }
        ];
      case 'Brake Service':
        return [
          {
            'name': 'Brake Masters',
            'services': {
              'Brake Pad Replacement': 1200.0,
              'Brake Fluid Check': 600.0,
            },
          },
          {
            'name': 'SafeDrive Brake Service',
            'services': {
              'Brake Pad Replacement': 1400.0,
              'Brake Inspection': 1000.0,
            },
          }
        ];
      default:
        return [];
    }
  }

  void _showCancelOrderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Order'),
          content: Text('Are you sure you want to cancel the order?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Logic to cancel the order
                Navigator.pop(context); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order has been cancelled')),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final serviceStations = _getServiceStations(category);

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Services'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: serviceStations.length,
        itemBuilder: (context, index) {
          final station = serviceStations[index];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.build, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(
                        station['name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...station['services'].entries.map((service) {
                    final serviceName = service.key;
                    final price = service.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(serviceName),
                          Text('₹${price.toStringAsFixed(2)}'),
                        ],
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Proceeding to payment for $category service'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Pay Now'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _showCancelOrderDialog(
                          context); // Show cancel order dialog
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Cancel Order'),
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
