import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_management_page.dart';

class Setting extends StatelessWidget {
 const Setting({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _buildCard(
            icon: Icons.person,
            iconColor:Colors.orange,
            title: 'Personal Information',
            onTap: () {
              Get.to(PersonalInformationPage());
            },
          ),
          _buildCard(
            icon: Icons.account_balance,
            iconColor:Colors.orange,
            title: 'Bank Accounts',
            onTap: () {
              Navigator.pushNamed(context, '/bankAccounts'); // Navigate to the bank accounts page using traditional navigation
            },
          ),
          _buildCard(
            icon: Icons.notifications,
            iconColor:Colors.orange,
            title: 'Notifications',
            onTap: () {
              Navigator.pushNamed(context, '/notifications'); // Navigate to the notifications page using traditional navigation
            },
          ),
          _buildCard(
            icon: Icons.support,
            iconColor:Colors.orange,
            title: 'Support',
            onTap: () {
              Navigator.pushNamed(context, '/support'); // Navigate to the support page using traditional navigation
            },
          ),
          _buildCard(
            icon: Icons.fingerprint,
            iconColor:Colors.orange,
            title: 'Biometric Login',
            onTap: () {
              // Perform biometric login setup logic here
            },
          ),

          _buildCard(
            icon: Icons.local_offer,
            iconColor:Colors.orange,
            title: 'Offers & Discounts',
            onTap: () {
              Navigator.pushNamed(context, '/offers'); // Navigate to the offers and discounts page using traditional navigation
            },
          ),
          _buildCard(
            icon: Icons.card_giftcard,
            iconColor:Colors.orange,
            title: 'Rewards Points',
            onTap: () {
              Navigator.pushNamed(context, '/rewardsPoints'); // Navigate to the rewards points page using traditional navigation
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.green,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: iconColor, // Apply the specified color to the icon
        ),

        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}