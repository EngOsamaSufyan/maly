import 'package:flutter/material.dart';



class PayShoppingPage extends StatefulWidget {
  @override
  State<PayShoppingPage> createState() => _PayShoppingPageState();
}

class _PayShoppingPageState extends State<PayShoppingPage> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

  String? selectedCurrency;

  List<String> Currency = [
    'RY',
    'RS',
    'USD',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Text(
              'Payment Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: accountController,
              decoration:  InputDecoration(
                labelText: 'Account Number',
                icon: Icon(Icons.account_balance_outlined),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: accountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      icon: Icon(Icons.numbers),

                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 16.0),
                SizedBox(height: 16.0),
                Expanded(
                  child:   DropdownButton<String>(
                    hint: Text('Select a Currency'),
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

              ],
            ),
            SizedBox(height: 16),
            MaterialButton(
              elevation: 5.0,
              color: Colors.orange[900],
              padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 30
              ),
              child: const Text('pay Now',
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
                String account = amountController.text;
                if (amount.isEmpty||account.isEmpty) {
    // Display an error dialog if any field is empty or any image is missing
            showDialog(

            context: context,
            builder: (BuildContext context) {
            return AlertDialog(
            title: Icon(Icons.error,color: Colors.red,size: 50,),
            content: Text('Please Fill All filed...! .'),
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
                );}
              },

            ),
          ],
        ),
      ),
    );
  }
}