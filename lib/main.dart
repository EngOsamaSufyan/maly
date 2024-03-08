import 'package:flutter/material.dart';
import 'package:maly/pages/loginpage.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Maly());
}
class Maly extends StatelessWidget {
  const Maly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

      home:LoginScreen(),

    );
  }
}
