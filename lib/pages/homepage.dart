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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.notifications,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        body: Center(

          child: Column(
            children: [
              Center(
                child: MalyCard(),
              ),
              SizedBox(height: 20),
              Text(
                'Services',
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white70,
                          Colors.white,
                          Colors.green,
                          Colors.white,
                          Colors.greenAccent,
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                        borderRadius: BorderRadius.only(
                          bottomLeft:  Radius.circular(40),
                          bottomRight:  Radius.circular(40),),
                    ),
                    height: 250,
                    child: Column(
                  children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceIcon(
                    icon: Icons.qr_code,
                    label: 'Service 1',
                    onTap: () {

                    },
                  ),
                  ServiceIcon(
                    icon: Icons.javascript,
                    label: 'Service 2',
                    onTap: () {
                      // Handle tapping on Service 2
                    },
                  ),
                  ServiceIcon(
                    icon: Icons.offline_bolt,
                    label: 'Service 3',
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
                    icon: Icons.u_turn_left,
                    label: 'Service 4',
                    onTap: () {
                      // Handle tapping on Service 4
                    },
                  ),
                  ServiceIcon(
                    icon: Icons.kayaking,
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
  ]
              )
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