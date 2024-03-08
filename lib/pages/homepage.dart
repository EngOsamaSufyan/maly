import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maly/pages/cache.dart';
import 'package:maly/pages/card.dart';
import 'package:maly/pages/moneytransfer.dart';
import 'package:maly/pages/notifications.dart';
import 'package:maly/pages/payshopping.dart';
import 'package:maly/pages/pillpay.dart';
import 'package:maly/pages/recevemoney.dart';
import 'package:maly/pages/support.dart';

import '../code/verable.dart';
import 'otherservice.dart';
import 'changepass.dart';
import 'loginpage.dart';




class HomePage extends StatelessWidget {
  Malyvarable maly =Get.put(Malyvarable());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         centerTitle: true,
          backgroundColor: Colors.white70,
          title:  Text('Maly',
              style:TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold

              )
          ),
         actions: [
           IconButton(
             alignment: Alignment.topRight,
             icon: Icon(
               Icons.notifications_none,
               color: Colors.orange,
             ),
             onPressed: () {
               // Handle button click here
               Get.to(NotificationsPage());
             },
           ),

         ],

        ),

        drawer: Drawer(

          child:
          ListView(
            children: [

              Container(
                height: 180,
                width: 415,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white10,
                          Colors.white,
                          Colors.blueGrey,
                          Colors.blueGrey,
                          Colors.blueGrey,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.only(

                        bottomRight: Radius.circular(70),
                      )

                  ),
                  height: 250,
                  child: Column(
                    children: [
                      SizedBox(height: 0),
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Osama Sufyan',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),

                      GetBuilder<Malyvarable>(
                        builder: (maly)=>
                            Text(
                              maly.Phone.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildCard(
                icon: Icons.notifications,
                iconColor: Colors.orange,
                title: 'Notifications',
                onTap: () {
                  Get.to(NotificationsPage());
                  // Navigate to the notifications page using GetX navigation
                },
              ),

              _buildCard(
                icon: Icons.support,
                iconColor: Colors.orange,
                title: 'Support',
                onTap: () {
                  Get.to(SupportPage());
                  // Navigate to the support page using GetX navigation
                },
              ),
              _buildCard(
                icon: Icons.lock,
                iconColor: Colors.orange,
                title: 'Change Password',
                onTap: () {
                  Get.to(ChangePasswordPage());
                  // Navigate to the change password page using GetX navigation
                },
              ),
              _buildCard(
                icon: Icons.logout_outlined,
                iconColor: Colors.orange,
                title: 'Logout',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Woring'),
                        content: Text('Sur to Logout'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offAll(LoginScrren());
                              // Close the dialog
                              // Process the bill payment
                            },
                            child: Text('sur'),
                          ),
                        ],
                      );
                    },
                  );

                  // Navigate to the login screen using GetX navigation
                },
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Column(

            children: [

              SizedBox(height: 10),

              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.account_balance_outlined,
                  color: Colors.orange,
                  )
                ],
              ),

              SizedBox(height: 2),
                        Container(
                          height: 210,
                          width: 390,

                          child: ListView(
                            scrollDirection: Axis.horizontal,

                            children: [
                              MalyCard(),
                              SizedBox(width: 10),
                              MalyCard(),
                            ],
                          ),
                          
                        ),


              Text(
                'Services....',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,


                ),
              ),
              SizedBox(height: 10),
              Container(

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ServiceIconContainer(
                          icon: Icons.attach_money_sharp,
                          label: 'Cache',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => GetCashPage(),
                            );
                          },
                        ),
                        ServiceIconContainer(
                          icon: Icons.phone_android_sharp,
                          label: 'Telephone',
                          onTap: () {
                            Get.to(ComingSoonPage());
                          },
                        ),
                        ServiceIconContainer(
                          icon: Icons.shopping_cart,
                          label: 'Shopping',
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context){
                                  return Container(
                                    height: MediaQuery.of(context).size.height *1, // Set the desired height here
                                    child: PayShoppingPage(),
                                  );
                                }
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServiceIconContainer(
                          icon: Icons.keyboard_double_arrow_down,
                          label: 'Money Receve',
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context){
                                  return Container(
                                    height: MediaQuery.of(context).size.height *1, // Set the desired height here
                                    child: MoneyReceivePage(),
                                  );
                                }
                            );
                          },
                        ),
                        ServiceIconContainer(
                          icon: Icons.keyboard_double_arrow_up,
                          label: 'MoneyTransf',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context){
                                return Container(
                                  height: MediaQuery.of(context).size.height *1, // Set the desired height here
                                  child: MoneyTransferPage(),
                                );
                              }
                            );
                          },
                        ),
                        ServiceIconContainer(

                          icon: Icons.payments,
                          label: 'Pay Pill',
                          onTap: () {
                            showModalBottomSheet(
                                context: context,

                                builder: (context){
                                  return Container(
                                    height: MediaQuery.of(context).size.height *1, // Set the desired height here
                                    child: BillPaymentPage(),
                                  );
                                }
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey,),
              IconButton(onPressed: (){

              }, icon: Icon(
                Icons.add_box,
                color: Colors.orange,
              ), ),

            ],
          ),
        ),
      ),
    );


  }

}

class ServiceIconContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceIconContainer({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 130,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 5),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color(0xFF8191ff), Color(0x5779BFFF)

                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

                borderRadius:  BorderRadius.circular(30),



            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: Colors.orange,
                ),
                SizedBox(height: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard({
  required IconData icon,
  required Color iconColor,
  required String title,
  required VoidCallback onTap,
}) {
  return
    Container(
      child:
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: iconColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),);
}