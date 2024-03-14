import 'package:flutter/material.dart';

class Package {
  final String name;
  final double price;

  Package({required this.name, required this.price});
}

class WifiBalancePage extends StatefulWidget {
  @override
  _ChargeBalancePageState createState() => _ChargeBalancePageState();
}

class _ChargeBalancePageState extends State<WifiBalancePage> {

  Package? _selectedPackage;

  List<Package> _packages = [
    Package(name: 'Package 10G', price: 10.0),
    Package(name: 'Package 20G', price: 20.0),
    Package(name: 'Package 30G', price: 30.0),
    Package(name: 'Package 40G', price: 40.0),
    Package(name: 'Package 50G', price: 50.0),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Charge WiFi Entrnet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'WiFi ID',
              ),
            ),

            SizedBox(height: 32),
            Text(
              'Select Package',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<Package>(
              value: _selectedPackage,
              onChanged: (Package? newValue) {
                setState(() {
                  _selectedPackage = newValue;
                });
              },
              items: _packages.map((Package package) {
                return DropdownMenuItem<Package>(
                  value: package,
                  child: Text('${package.name} (\$${package.price.toStringAsFixed(2)})'),
                );
              }).toList(),

            ),
            SizedBox(height: 32),
            MaterialButton(
              elevation: 5.0,
              color: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20
              ),
              child: const Text('Cahrge Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text(' Are you sure you want to charge the WiFi balance?'),

                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Charge'),
                          onPressed: () {
                            // Implement the logic to charge the SIM balance here
                            Navigator.of(context).pop();
                            // Show success message or navigate to another screen
                          },
                        ),
                      ],
                    );
                  },
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}