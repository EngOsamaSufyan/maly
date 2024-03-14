import 'package:flutter/material.dart';
class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Color(0xFFfbb79B),Color(0x4779B96F)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF40BFFF),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our amazing new app is\ncoming soon!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color:Color(0xFF01579B),
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: 200,
                child:LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: Colors.transparent,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}