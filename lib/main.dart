import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maly/pages/delete.dart';
import 'package:maly/pages/getstert.dart';
import 'package:maly/pages/nav.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Maly());
}
class Maly extends StatelessWidget {
  const Maly({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      home:Start(),

    );
  }
}
