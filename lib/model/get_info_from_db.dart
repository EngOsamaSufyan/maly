import 'package:get/get.dart';
import '../maly_db/db.dart';

class Getinfo extends GetxController {
  bool isBalanceVisible = false;
  String? name;
  String? number;
  String? balance;

  List<Map<String, dynamic>> users = [];

  Future<void> fetchUsers() async {
    final user1 = await MyDatabase.getUsers();
      users = user1;
    final user =users[2];
    name = user['name'];
    number = user['number'];

      update();

  }


  void toggleBalanceVisibility() {
      isBalanceVisible = !isBalanceVisible;
    update();
  }


}