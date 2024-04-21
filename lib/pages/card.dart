import 'package:flutter/material.dart';
import '../model/get_info_from_db.dart';
import 'loginpage.dart';
import 'package:get/get.dart';
import '../maly_db/db.dart';
import 'dart:async' show Future;


class MalyCard extends StatefulWidget {

  @override
  State<MalyCard> createState() => _MalyCardState();
}

class _MalyCardState extends State<MalyCard> {
  Getinfo getinfo =Get.put(Getinfo());
  bool isBalanceVisible = false;
String? name;
String? number;
String? balance;

  List<Map<String, dynamic>> _users = [];
  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }
  Future<void> _fetchUsers() async {
    final users = await MyDatabase.getUsers();
    setState(() {
      _users = users;
    });
  }

  void toggleBalanceVisibility() {
    setState(() {
      isBalanceVisible = !isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
   final user =_users[2];
    name = user['name'];
    number = user['number'];


    return Container(
      width: 350,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20)

        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBF3D5), Color(0x57C4E4FF)

          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
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
                SizedBox(height: 20),

                Text(
                number ?? 'Loading...', // Show loading indicator if number is null
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
           // Show loading indicator if name is null
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Card Holder',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(name ?? 'Loading...'),
                  ],
                ),

                Expanded(
                  flex: 1,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.orange,

                        ),
                        onPressed: toggleBalanceVisibility,
                      ),
                      isBalanceVisible
                          ? Text(
                    balance?? 'Loading...',
                        style: TextStyle(fontSize: 15),
                      )
                          : Text(
                        '***',
                        style: TextStyle(fontSize: 20),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
