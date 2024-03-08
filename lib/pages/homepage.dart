import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maly/pages/card.dart';
import 'package:maly/pages/settingspage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              ),
              SizedBox(height: 20),

              Center(
                child: MalyCard(),
              ),
              SizedBox(height: 20),
              Text(
                'Services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                width: 400,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent,
                        Colors.green,
                        Colors.greenAccent,
                        Colors.green,
                        Colors.greenAccent,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  height: 250,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceIcon(
                            icon: Icons.attach_money_sharp,
                            label: 'Cache',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return MalyCard();
                                },
                              );
                            },
                          ),
                          ServiceIcon(
                            icon: Icons.shopping_cart,
                            label: 'Shopping',
                            onTap: () {
                              // Handle tapping on Service 2
                            },
                          ),
                          ServiceIcon(
                            icon: Icons.phone_android,
                            label: 'Phone',
                            onTap: () {
                              // Handle tapping on Service 3
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceIcon(
                            icon: Icons.keyboard_double_arrow_left_sharp,
                            label: 'Get',
                            onTap: () {
                              // Handle tapping on Service 4
                            },
                          ),
                          ServiceIcon(
                            icon: Icons.keyboard_double_arrow_right_rounded,
                            label: 'Service 5',
                            onTap: () {
                              // Handle tapping on Service 5
                            },
                          ),
                          ServiceIcon(
                            icon: Icons.label,
                            label: 'Service 6',
                            onTap: () {
                              // Handle tapping on Service 6
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 50),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}