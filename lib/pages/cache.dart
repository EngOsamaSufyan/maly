import 'package:flutter/material.dart';

class GetCashPage extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cash',
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
                color: Colors.orange[900],
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: const Text(
                  'Get Cash',
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
                  // Process the cash withdrawal
                  String amount = amountController.text;
                  // Add your logic here for processing the cash withdrawal
                  if (amount.isEmpty) {
                            // Display an error dialog if any field is empty or any image is missing
                            showDialog(

                            context: context,
                            builder: (BuildContext context) {
                            return AlertDialog(
                            title: Icon(Icons.error,color: Colors.red,size: 50,),
                            content: Text('Please Enter the Amonts...! .'),
                            );
                            },
                            );}
                  else{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Cash Withdrawal'),
                        content: Text('Amount: $amount'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.white,
                                  behavior: SnackBarBehavior.floating,
                                  content: Row(
                                    children: [
                                      Icon(Icons.send_outlined, color: Colors.orange),
                                      SizedBox(width: 20),
                                      Text(
                                        'Money Will Be Received...',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  action: SnackBarAction(
                                    label: 'Success',
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
                  );}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
