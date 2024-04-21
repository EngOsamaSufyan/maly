import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:maly/pages/buttom_navegetor_bar.dart';
import 'package:maly/pages/forgetpass.dart';
import 'package:flutter/services.dart';
import '../maly_db/db.dart';


class LoginScrren extends StatefulWidget {

  @override
  State<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
  TextEditingController _accountNumber =TextEditingController();

  TextEditingController _pass =TextEditingController();

  get phoneNumber => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(

      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 1),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget> [

              Container(
                width:450,
                height: 250,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xf7124076),Color(0xf735374B),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),

                      )

                  ),
                  child:Image.asset('assets/images/logo.png'),
                ),

              ),

              const SizedBox(height: 50,),
              TextField(
                controller: _accountNumber,

                decoration: InputDecoration(
                  hintText: 'Accaount Number',
                  prefixIcon: Icon(Icons.person,
                  color: Colors.orange,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                obscureText: true,
                controller: _pass,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.remove_red_eye,
                  color: Colors.orange,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45,),
              MaterialButton(
                  elevation: 5.0,
                  color: Colors.orange[900],
                  padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50
                  ),
                  child: const Text('Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none
                  ),
                onPressed: () async {
                  String phoneNumber = _accountNumber.text;
                  String password = _pass.text;

                  final user = await MyDatabase.getUserByPhoneNumberAndPassword(phoneNumber, password);

                  if (user != null) {
                    // Authentication successful
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content:
                             Container(
                               height: 170,
                               width: 390,
                               color: Colors.transparent,
                               child: ListView(
                                 children: [
                                   LinearProgressIndicator(
                                     valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                     backgroundColor: Colors.transparent,

                                   ),
                                   Image.asset('assets/images/logo.png',
                                     width: 200, height: 150,
                                   ),
                                   LinearProgressIndicator(
                                     valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                     backgroundColor: Colors.transparent,

                                   ),

                                 ],

                               ),

                             ),

                        );
                      },
                    );
                    await Future.delayed(Duration(seconds:3));
                    Navigator.of(context).pop();
                    Get.offAll(ButtomBarPages());
                  } else {
                    // Authentication failed
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Icon(
                            Icons.disabled_by_default,
                            size: 100,
                            color: Colors.red,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                                setState(() {
                                  _accountNumber .clear();
                                  _pass.clear();
                                }); // Navigate back to the login page
                              },
                              child: Text('Retry'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.to(ForgotPasswordPage());
                                 },
                child: Text('Forget the password'
                    ,style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    )
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
