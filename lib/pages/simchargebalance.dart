import 'package:flutter/material.dart';

class Package {
  final String name;
  final double price;

  Package({required this.name, required this.price});
}

class SimchargeBalancePage extends StatefulWidget {
  @override
  _ChargeBalancePageState createState() => _ChargeBalancePageState();
}

class _ChargeBalancePageState extends State<SimchargeBalancePage> {
  Package? _selectedPackage;

  List<Package> _packages = [
    Package(name: 'Package A', price: 10.0),
    Package(name: 'Package B', price: 20.0),
    Package(name: 'Package C', price: 30.0),
    Package(name: 'Package D', price: 40.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charge SIM Now'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            SizedBox(height: 32),
            Text(
              '4G',
              style: TextStyle(fontSize: 16,
              color: Colors.green
              ),
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
            SizedBox(height: 10),
            MaterialButton(
              elevation: 5.0,
              color: Colors.green,
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
                      content: Text('Are you sure you want to charge the SIM balance?'),
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
            Divider(),
            SizedBox(height: 10),
            Text(
              'Call Package',
              style: TextStyle(fontSize: 16,

                  color: Colors.green),
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
            SizedBox(height: 10),
            MaterialButton(
              elevation: 5.0,
              color: Colors.green,
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
                      content: Text('Are you sure you want to charge the SIM balance?'),
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
            Divider(),
            Text(
              'Normal Balance',
              style: TextStyle(fontSize: 16,
                  color: Colors.green),
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
            SizedBox(height: 10),
            MaterialButton(
              elevation: 5.0,
              color: Colors.green,
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
                      content: Text('Are you sure you want to charge the SIM balance?'),
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