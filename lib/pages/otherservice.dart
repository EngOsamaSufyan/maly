import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ Color(0xf7124076),Color(0xf735374B),],
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

              LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF01579B),
                rightDotColor: const Color(0xf779BFFF),
                size: 100,
              ),
              LoadingAnimationWidget.waveDots(color: Colors.blue, size: 100)
          ],
          ),
        ),
      ),
    );
  }
}