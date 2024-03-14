import 'package:flutter/material.dart';

class BillPaymentPage extends StatefulWidget {
  @override
  _BillPaymentPageState createState() => _BillPaymentPageState();
}

class _BillPaymentPageState extends State<BillPaymentPage> {
  String? selectedService;
  String? accountNumber;


  List<String> services = [
    'Electricity',
    'Water',
    'Telephone',
    'Internet',
    'Phone Credit',
    'Purchases',
  ];


  void processBillPayment() {
    // Add your logic here for processing the bill payment
    // This function will be called when the user confirms the payment

    // Show a notification to indicate successful payment
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Notification'),
          content: Text('Bill payment successful.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,


          children: [
            SizedBox(height: 40),
            Text('Pay Pill ',
              style: TextStyle(
                color: Colors.black26,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),

            SizedBox(height: 20),
            Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child:   DropdownButton<String>(
                  hint: Text('Select a service'),
                  value: selectedService,
                  onChanged: (newValue) {
                    setState(() {
                      selectedService = newValue;
                    });
                  },
                  items: services.map((service) {
                    return DropdownMenuItem<String>(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.account_balance_outlined),
                    onPressed: () {
                      // Handle search button click
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Account Number...',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.numbers),
                    onPressed: () {
                      // Handle search button click
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter amount...',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Add code here to display bill details, such as amount, currency, due date
            SizedBox(height: 20),


            SizedBox(height: 20),
            MaterialButton(
              elevation: 100.0,
              color: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 50
              ),
              child: Text('Pay Bill',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,

              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Payment Confirmation'),
                      content: Text('Do you want to proceed with the payment?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            processBillPayment(); // Process the bill payment
                          },
                          child: Text('Confirm'),
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