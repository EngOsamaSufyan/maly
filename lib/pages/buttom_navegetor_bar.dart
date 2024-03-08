
import 'package:flutter/material.dart';
import 'package:maly/pages/account_management_page.dart';
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
              Setting(),
              HomePage(),
              PersonalInformationPage(),

            ],
          ),
          extendBody: true,
          bottomNavigationBar: RollingBottomBar(
            color: Colors.orangeAccent,
            controller: _pageControlller,
            flat: true,
            useActiveColorByDefault: false,
            items: const [
              RollingBottomBarItem(Icons.settings,
                  label: 'Sttings', activeColor: Colors.green),
              RollingBottomBarItem(Icons.monetization_on_rounded,
                  label: 'Process', activeColor: Colors.green),
              RollingBottomBarItem(Icons.person,
                  label: 'Accaount', activeColor: Colors.green),
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