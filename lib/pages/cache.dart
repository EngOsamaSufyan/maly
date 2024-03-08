import 'package:flutter/material.dart';

class GetCashPage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor:Colors.black12,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cahe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
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
                            hintText: 'Enter the amount...',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              MaterialButton(
                elevation: 5.0,
                color: Colors.green,
                padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 30
                ),
                child: const Text('Get Cache',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                onPressed: () {
                  // Process the cash withdrawal
                  String amount = amountController.text;
                  // Add your logic here for processing the cash withdrawal

                  // Show a dialog or snackbar to indicate success
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Cash Withdrawal'),
                        content: Text('Amount: $amount'),
                        actions: [
                          TextButton(
                            onPressed: () {
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