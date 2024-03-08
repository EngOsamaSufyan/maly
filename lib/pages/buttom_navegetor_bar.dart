
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'homepage.dart';
import 'settingspage.dart';

class ButtomBarPages extends StatelessWidget {
  ButtomBarPages({super.key});
  final _pageControlller = PageController();

  @override
  void dispose() {
    _pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SafeArea(child:  Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            controller: _pageControlller,
            children: const <Widget>[
              SettingsPage(),
              HomePage(),


            ],
          ),
          extendBody: true,
          bottomNavigationBar: RollingBottomBar(
            color: const Color.fromARGB(300, 100, 0, 0),
            controller: _pageControlller,
            flat: true,
            useActiveColorByDefault: false,
            items: const [
              RollingBottomBarItem(Icons.settings,
                  label: 'Settengs', activeColor: Colors.blue),
              RollingBottomBarItem(Icons.home,
                  label: 'home', activeColor: Colors.blue),
              RollingBottomBarItem(Icons.person,
                  label: 'Accaount', activeColor: Colors.blue),
            ],
            enableIconRotation: true,
            onTap: (index) {
              _pageControlller.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
              );
            },
          ),
        ),
        ));
  }
}