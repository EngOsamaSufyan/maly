import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'otherservice.dart';
import 'homepage.dart';

class nav extends StatefulWidget {
  const nav({super.key});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.greenAccent,
        color: Colors.green,
        animationDuration: Duration(milliseconds: 200),
        onTap: (index){

        },
        items: [
          Icon(Icons.home),
          Icon(Icons.home),
          Icon(Icons.home),
        ],
      ),
    );
  }
}