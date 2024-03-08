import 'package:get/get.dart';

class Malyvarable extends GetxController{
  var balance = 600.00;
  var Phone = 735903811;
  String pass = 'os';
  bool showBalance = false;
  void toggleBalanceVisibility() {

      showBalance = !showBalance;
update();
  }


}
