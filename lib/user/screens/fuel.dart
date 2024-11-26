import 'package:flutter/material.dart';

void main() {
  runApp(FuelStationApp());
}

class FuelStationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FuelStationList(),
    );
  }
}

class FuelStationList extends StatefulWidget {
  @override
  _FuelStationListState createState() => _FuelStationListState();
}

class _FuelStationListState extends State<FuelStationList> {
  final List<Map<String, dynamic>> fuelStations = [
    {
      'name': 'Indian Oil Fuel Station',
      'location': 'Location A',
      'address': '123, ABC Road, Location A',
      'contactNumber': '+91 1234567890',
      'fuels': {
        'Petrol': 103.0, // price per liter
        'Diesel': 93.0,
      }
    },
    {
      'name': 'HP Station',
      'location': 'Location B',
      'address': '456, XYZ Road, Location B',
      'contactNumber': '+91 2345678901',
      'fuels': {
        'Petrol': 101.5,
        'Diesel': 91.5,
        'CNG': 72.0,
      }
    },
    {
      'name': 'Nayara Fuel Station',
      'location': 'Location A',
      'address': '789, PQR Road, Location A',
      'contactNumber': '+91 3456789012',
      'fuels': {
        'Petrol': 104.0,
        'Diesel': 94.0,
        'CNG': 70.5,
      }
    },
    {
      'name': 'Shell Fuel Station',
      'location': 'Location C',
      'address': '321, DEF Road, Location C',
      'contactNumber': '+91 4567890123',
      'fuels': {
        'Petrol': 105.5,
        'Diesel': 95.0,
        'CNG': 71.0,
      }
    },
    {
      'name': 'Essar Fuel Hub',
      'location': 'Location B',
      'address': '654, GHI Road, Location B',
      'contactNumber': '+91 5678901234',
      'fuels': {
        'Petrol': 100.0,
        'Diesel': 90.0,
        'CNG': 68.0,
      }
    },
    {
      'name': 'Reliance Fuel Station',
      'location': 'Location C',
      'address': '987, JKL Road, Location C',
      'contactNumber': '+91 6789012345',
      'fuels': {
        'Petrol': 106.0,
        'Diesel': 96.0,
        'CNG': 73.0,
      }
    },
  ];

  int? selectedStationIndex; // Tracks the selected station
  String? selectedFuel;
  double quantity = 0.0;
  double totalPrice = 0.0;

  // Location filter variable
  String enteredLocation = '';

  // Method to filter stations based on the entered location
  List<Map<String, dynamic>> getFilteredStations() {
    if (enteredLocation.isEmpty) {
      return fuelStations;
    }

    return fuelStations
        .where((station) =>
            station['location']!.toLowerCase().contains(enteredLocation.toLowerCase()))
        .toList();
  }

  void calculatePrice(String fuel, double pricePerLiter, double qty) {
    setState(() {
      selectedFuel = fuel;
      quantity = qty;
      totalPrice = pricePerLiter * qty;
    });
  }

  void showConfirmDialog() {
    // Show a confirmation dialog before proceeding to payment
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Your Order"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fuel: $selectedFuel', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Quantity: $quantity liters', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Total Price: ₹${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Cancel the order: Reset the state and show a cancellation message
                Navigator.pop(context); // Close the dialog
                setState(() {
                  selectedFuel = null;
                  quantity = 0.0;
                  totalPrice = 0.0;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order canceled. No payment processed.'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                // Proceed with payment: Handle the payment action
                Navigator.pop(context); // Close the dialog

                // Show a confirmation message after payment is processed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Payment confirmed! ₹${totalPrice.toStringAsFixed(2)} paid successfully.'),
                    backgroundColor: Colors.green,
                  ),
                );

                // Reset after confirmation (optional)
                setState(() {
                  selectedFuel = null;
                  quantity = 0.0;
                  totalPrice = 0.0;
                });

                // Show confirmation message as a dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text(
                          'Your payment of ₹${totalPrice.toStringAsFixed(2)} for $quantity liters of $selectedFuel has been successfully processed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close confirmation dialog
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredStations = getFilteredStations();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fuel Stations',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        enteredLocation = text;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Location (e.g., Location A)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      enteredLocation = '';
                    });
                  },
                ),
              ],
            ),
          ),
          // Show a message if no stations are found
          if (filteredStations.isEmpty)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'No fuel stations found for the entered location.',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStations.length,
              itemBuilder: (context, index) {
                final station = filteredStations[index];
                final isSelected = selectedStationIndex == index;

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.local_gas_station,
                              color: Colors.orange,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              station['name'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Radio<int>(  // Select the fuel station
                              value: index,
                              groupValue: selectedStationIndex,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedStationIndex = value;
                                  selectedFuel = null;
                                  quantity = 0.0;
                                  totalPrice = 0.0;
                                });
                              },
                            ),
                          ],
                        ),
                        if (isSelected) ...[
                          // Display the details for the selected station
                          Text('Address: ${station['address']}'),
                          Text('Contact: ${station['contactNumber']}'),
                          SizedBox(height: 10),
                          // Display available fuels and prices
                          ...station['fuels'].entries.map((fuel) {
                            final fuelName = fuel.key;
                            final pricePerLiter = fuel.value;
                            return Row(
                              children: [
                                Checkbox(
                                  value: selectedFuel == fuelName,
                                  onChanged: (bool? value) {
                                    if (value != null && value) {
                                      setState(() {
                                        selectedFuel = fuelName;
                                        totalPrice = 0.0;
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  '$fuelName - ₹${pricePerLiter.toStringAsFixed(2)} per liter',
                                  style: TextStyle(fontSize: 16),
                                ),
                                if (selectedFuel == fuelName)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        Text(' Enter the Quantity:'),
                                        SizedBox(width: 5),
                                        Container(
                                          width: 80,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                calculatePrice(
                                                    selectedFuel!,
                                                    pricePerLiter,
                                                    double.parse(value));
                                              }
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Enter qty',
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            );
                          }).toList(),
                          SizedBox(height: 10),
                          if (selectedFuel != null && quantity > 0)
                            ElevatedButton(
                              onPressed: showConfirmDialog,
                              child: Text('Proceed to Payment'),
                            ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
