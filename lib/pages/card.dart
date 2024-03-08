import 'package:flutter/material.dart';

class MalyCard extends StatefulWidget {
  @override
  _MalyCardState createState() => _MalyCardState();
}

class _MalyCardState extends State<MalyCard> {
  bool showBalance = false;

  void toggleBalanceVisibility() {
    setState(() {
      showBalance = !showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleBalanceVisibility,
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.white60,
              Colors.greenAccent,
              Colors.orangeAccent,
              Colors.yellow,
              Colors.orange,
              Colors.yellowAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Replace with your card logo image
                    width: 70,
                    height: 50,
                  ),
                  Text(
                    '**** **** **** 1234', // Replace with your card number
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20),
              Text(
                'Card Holder',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Osama Sufyan'), // Replace with card holder's name
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expires',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('12/26'), // Replace with card expiration date
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance RY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (showBalance)
                          Text('\500.00') // Replace with card balance
                        else
                          Text('***') // Replace with masked balance
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: toggleBalanceVisibility,
                    child: Icon(Icons.visibility),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
