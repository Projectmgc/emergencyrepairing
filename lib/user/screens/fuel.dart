import 'package:flutter/material.dart';

void main() {
  runApp(FuelStationApp());
}

class FuelStationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      'name': 'Indian Oil Fuel Station ',
      'fuels': {
        'Petrol': 103.0, // price per liter
        'Diesel': 93.0,
      }
    },
    {
      'name': 'HP Station ',
      'fuels': {
        'Petrol': 101.5,
        'Diesel': 91.5,
        'CNG': 72.0,
      }
    },
    {
      'name': 'Nayara Fuel Point ',
      'fuels': {
        'Petrol': 104.0,
        'Diesel': 94.0,
        'CNG': 70.5,
      }
    },
    {
      'name': 'Shell Fuel Station ',
      'fuels': {
        'Petrol': 105.5,
        'Diesel': 95.0,
        'CNG': 71.0,
      }
    },
    {
      'name': 'Essar Fuel Hub',
      'fuels': {
        'Petrol': 100.0,
        'Diesel': 90.0,
        'CNG': 68.0,
      }
    },
    {
      'name': 'Reliance Fuel Station ',
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

  void calculatePrice(String fuel, double pricePerLiter, double qty) {
    setState(() {
      selectedFuel = fuel;
      quantity = qty;
      totalPrice = pricePerLiter * qty;
    });
  }

  void proceedToPay() {
    // This is where you could add logic for proceeding to payment
    // For now, just show a confirmation message.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Proceeding to payment of ₹${totalPrice.toStringAsFixed(2)}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fuel Stations',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (selectedStationIndex != null)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fuelStations[selectedStationIndex!]['name'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: fuelStations.length,
              itemBuilder: (context, index) {
                final station = fuelStations[index];
                final isSelected = selectedStationIndex == index;

                return Card(
                  margin: EdgeInsets.all(10),
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Radio<int>(
                              value: index,
                              groupValue: selectedStationIndex,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedStationIndex = value;
                                  selectedFuel = null; // Reset fuel selection
                                  quantity = 0.0;
                                  totalPrice = 0.0;
                                });
                              },
                            ),
                          ],
                        ),
                        if (isSelected)
                          Column(
                            children: [
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
                                            totalPrice =
                                                0.0; // Reset on fuel change
                                          });
                                        }
                                      },
                                    ),
                                    Text(
                                      '$fuelName - ₹${pricePerLiter.toStringAsFixed(2)}/L',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                );
                              }).toList(),
                              if (selectedFuel != null)
                                Column(
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: 'Enter quantity (liters)',
                                      ),
                                      onChanged: (value) {
                                        final qty =
                                            double.tryParse(value) ?? 0.0;
                                        calculatePrice(
                                          selectedFuel!,
                                          station['fuels'][selectedFuel],
                                          qty,
                                        );
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    if (quantity > 0)
                                      Text(
                                        'Total Price: ₹${totalPrice.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    SizedBox(height: 20),
                                    // Proceed to Pay button
                                    ElevatedButton(
                                      onPressed:
                                          totalPrice > 0 ? proceedToPay : null,
                                      child: Text('Proceed to Pay'),
                                      style: ElevatedButton.styleFrom(

                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 30),
                                        textStyle: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
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
