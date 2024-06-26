import 'package:flutter/material.dart';

class MoneyTransferPage extends StatefulWidget {
  @override
  State<MoneyTransferPage> createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State<MoneyTransferPage> {
  final TextEditingController accountController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  String? selectedCurrency;

  List<String> Currency = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'CAD',
    'AUD',
    'CHF',
    'CNY',
    'SEK',
    'NZD',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.blue[900],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text('Money Transfer ',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 16),
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
                      icon: Icon(Icons.account_balance_sharp),
                      onPressed: () {
                        // Handle search button click
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          controller: accountController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter account...',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
                          controller: amountController,
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
              SizedBox(height: 16),
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
                    hint: Text('Select Currency'),
                    value: selectedCurrency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCurrency = newValue;
                      });
                    },
                    items: Currency.map((service) {
                      return DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),
              MaterialButton(
                elevation: 100.0,
                color: Colors.orange[900],
                padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50
                ),
                child: const Text('Transefer Money',
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
                  // Process the received money
                  String account = accountController.text;
                  String amount = amountController.text;

                  if (
                  account.isEmpty ||
                      amount.isEmpty
                  ) {
                    // Display an error dialog if any field is empty or any image is missing
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Icon(Icons.error,color: Colors.red,size: 30,),
                          content: Text('Please fill in all fields .'),
                        );
                      },
                    );
                    return; // Exit the function early if there is an error
                  }

                  setState(() {
                    accountController .clear();
                    amountController.clear();
                  });
                  // Show a dialog or snackbar to indicate success
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Money Transefer'),
                        content: Text('Account: $account\nAmount: $amount'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.white,
                                  behavior: SnackBarBehavior.floating,
                                  content:Row(
                                    children: [
                                      Icon(Icons.send_outlined,color: Colors.orange,),
                                    SizedBox(width:20),
                                      Text('Money has Transfered, loading...',
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                      ),
                                    ],
                                  ),
                                  action: SnackBarAction(
                                    label: 'Secusess',
                                    onPressed: () {
                                      // Some code to undo the change
                                    },
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                      child: Text('OK'),
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
      ),
    );
  }
}