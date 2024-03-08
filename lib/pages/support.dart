import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
            ),
            SizedBox(height: 16),
            Text(
              'If you have any questions or need assistance, please feel free to contact our support team.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.mail, color: Colors.blue),
              title: Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                    color: Colors.green
                ),
              ),
              subtitle: Text(
                'maly.wallet@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Handle email tapping
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text(
                'Free Call',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                    color: Colors.green
                ),
              ),
              subtitle: Text(
                '8888400',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Handle phone tapping
              },
            ),
            Divider(),

            SizedBox(height: 32),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Follow us',style: TextStyle(
                  fontSize: 20,
                  color: Colors.green
                ),),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    // Handle Facebook icon press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.where_to_vote),
                  onPressed: () {
                    // Handle Twitter icon press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.telegram),
                  onPressed: () {
                    // Handle Instagram icon press
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}