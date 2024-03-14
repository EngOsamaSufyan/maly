import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:maly/code/verable.dart';
import 'package:maly/pages/buttom_navegetor_bar.dart';
import 'package:maly/pages/forgetpass.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


class LoginScrren extends StatelessWidget {
  LogIn maly =Get.put(LogIn());
  TextEditingController _accountNumber =TextEditingController();
  TextEditingController _pass =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(

      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 3),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget> [
              const SizedBox(height: 10),

              Image.asset('assets/images/logo.png',
                width: 200, height: 200,
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
                  color: Colors.blueGrey,
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
                  onPressed: ()async{
                    String account=_accountNumber.text;
                    String pass=_pass.text;
                    if (account==maly.Phone.toString()&& pass==maly.pass)
                      {

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(

                                content: Icon(Icons.gpp_good_outlined,
                                  size: 100,
                                  color: Colors.green,
                                ),
                              );
                            },
                          );
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.of(context).pop();
                          Get.offAll(ButtomBarPages());

                      }
                    else{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(

                            content:   Icon(Icons.gpp_bad_outlined,
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
                                  Get.offAll(LoginScrren());
                                   // Close the dialog
                                   // Process the bill payment
                                },
                                child: Text('ReTry'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                  }
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
