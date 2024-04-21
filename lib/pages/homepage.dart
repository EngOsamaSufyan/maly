import 'dart:async';

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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'otherservice.dart';
import 'changepass.dart';
import 'loginpage.dart';
import 'package:get/get_navigation/get_navigation.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cardController = PageController();
  bool _showCard = true;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      final nextPageIndex = (_currentPageIndex + 1) % 5;
      _pageController.animateToPage(
        nextPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         centerTitle: true,
          backgroundColor: Colors.transparent,
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
backgroundColor: Colors.transparent,
        drawer: Drawer(
          backgroundColor: Colors.transparent,

          child:
          ListView(
            children: [

              Container(
                height: 180,
                width: 150,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xf7124076),Color(0xf735374B),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
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
                            color: Colors.blue[900],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Osama Sufyan" ?? 'Loading...',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                            Text(
                              "" ?? 'Loading...',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),

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
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 2),
                  Visibility(
                    visible: _showCard,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [ Container(
                      height: 180,
                      width:410,

                      child: PageView(
                        controller: _cardController,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          MalyCard(),
                          MalyCard(),
                        ],
                      ),
                    ),

                   SmoothPageIndicator(
                      controller: _cardController,
                      count: 2,
                      effect: ExpandingDotsEffect(activeDotColor: Colors.orangeAccent),

                  ),
                ],
              ),),
              SizedBox(height: 2),
              Container(
                height: 40,
                width: 50,
               margin: EdgeInsets.only( left: 360),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    bottomLeft: Radius.circular(20),


                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFBF3D5), Color(0x57C4E4FF),
                      Color(0xFFf0fFFF)

                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    IconButton(
                        onPressed: () {
                          setState(() {
                            _showCard = !_showCard;
                          });
                        },
                        icon: Icon(
                          _showCard ? Icons.visibility_rounded: Icons.visibility_off,
                          color: Colors.orange,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 12,),
          Container(
            height: 120,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 150,
                ),
                Image.asset(
                  'assets/images/money-transfer (2).png',
                  width: 200,
                  height: 150,
                  color: Colors.orange,
                ),
                Image.asset(
                  'assets/images/payment.png',
                  width: 200,
                  height: 150,
                  color: Colors.orange,
                ),
                Image.asset(
                  'assets/images/money-transfer (1).png',
                  width: 200,
                  height: 150,
                  color: Colors.orange,
                ),
                Image.asset(
                  'assets/images/money-transfer.png',
                  width: 200,
                  height: 150,
                ),
              ],
            ),
          ),

              SizedBox(height: 10,),
              Divider(),
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
                          icon: Icons.get_app_outlined,
                          label: 'MoneyRece',
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
                          icon: Icons.send_outlined,
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
                                isScrollControlled: true,
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
                    SizedBox(height: 10,),
                    Divider(),
                    Text(
                      'Last Transaction...',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft:  Radius.circular(20),

                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFBF3D5), Color(0x57C4E4FF),
                            Color(0xFFfffFFF)

                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.payment,
                          color: Colors.green,
                        ),
                        title: Text(
                          'Payment Successful',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Your payment of \$20 for the order was successful.'),
                        trailing: Text(
                          '2 days ago',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 2,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft:  Radius.circular(20),

                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFBF3D5), Color(0x57C4E4FF),
                            Color(0xFFfffFFF)

                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.get_app_outlined,
                          color: Colors.green,
                        ),
                        title: Text(
                          'Money Receve Successful',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Your Money Receveof \$100 for the order was successful.'),
                        trailing: Text(
                          '2 hoers ago',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 130,
            height: 130,
            padding: EdgeInsets.symmetric(horizontal: 5),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Color(0xFFFBF3D5), Color(0x57C4E4FF),
                  Color(0xFF40BFFF)

                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
                borderRadius:  BorderRadius.only(

                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),

                ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  icon,
                  size: 50,
                  color: Colors.orange,
                ),
                SizedBox(height: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
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
        color: Color(0xb7F7EEDD),
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
              color: Colors.white,
            ),
          ),
          trailing: Icon(Icons.arrow_forward,color: Colors.orange,),
        ),
      ),);
}