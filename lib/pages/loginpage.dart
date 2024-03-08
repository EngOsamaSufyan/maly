import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:maly/pages/buttom_navegetor_bar.dart';

import 'package:maly/pages/forgetpass.dart';
import 'package:maly/pages/singup.dart';


class LoginScrren extends StatefulWidget {
  const LoginScrren({super.key});

  @override
  State<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
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
              const SizedBox(height: 20),

              Image.asset('assets/images/logo.png',
                width: 250, height: 250,
              ),
              const SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'User name',
                  prefixIcon: Icon(Icons.person),
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
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.remove_red_eye),
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
                  color: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 80
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
                  onPressed: (){
                    Get.to(ButtomBarPages());
                  }
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.to(Password());
                                 },
                child: Text('Forget the password'
                    ,style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    )
                ),
              ),
              const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                Get.to(Signup());
                },
                child: Text('Create Account'
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
