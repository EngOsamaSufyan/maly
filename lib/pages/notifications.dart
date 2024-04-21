import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 16),
          _buildNotificationItem(
            icon: Icons.send,
            title: 'Money Sent',
            subtitle: 'You sent \$100 to John Doe.',
            time: '10:30 AM',
            color: Colors.green,
          ),
          Divider(),
          _buildNotificationItem(
            icon: Icons.attach_money,
            title: 'Money Received',
            subtitle: 'You received \$50 from Jane Smith.',
            time: 'Yesterday',
            color: Colors.blue,
          ),
          Divider(),
          _buildNotificationItem(
            icon: Icons.payment,
            title: 'Payment Successful',
            subtitle: 'Your payment of \$20 for the order was successful.',
            time: '2 days ago',
            color: Colors.green,
          ),
          Divider(),
          _buildNotificationItem(
            icon: Icons.payment,
            title: 'Payment Failed',
            subtitle: 'Your payment of \$30 for the order failed.',
            time: '3 days ago',
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required Color color,
  }) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          icon,
          size: 30,
          color: color,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }
}