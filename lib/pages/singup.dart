import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maly/pages/loginpage.dart';
import 'buttom_navegetor_bar.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
              padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 3),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
          children: <Widget> [
          const SizedBox(height: 40),

          Image.asset('assets/images/logo.png',
          width: 250, height: 150,
          ),
          const SizedBox(height: 10,),
          TextField(
          decoration: InputDecoration(
          hintText: 'Name',
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
            const SizedBox(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                prefixIcon: Icon(Icons.phone_android),
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
            const SizedBox(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Prosnal Card ',
                prefixIcon: Icon(Icons.credit_card),
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
          const SizedBox(height: 10,),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton (
                  onPressed: () {
                    // Add your button action here
                  },
                  child: Icon(Icons.credit_card),
                ),
                Text('Front Card',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                MaterialButton (
                  onPressed: () {
                    // Add your button action here
                  },
                  child: Icon(Icons.credit_card_outlined),
                ),
                Text('Back Card',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton (
                  onPressed: () {
                    // Add your button action here
                  },
                  child: Icon(Icons.camera),
                ),
                Text('Selfy',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),




              ],
            ),


           SizedBox(height: 45,),
          MaterialButton(
          elevation: 5.0,
          color: Colors.green,
          padding:  EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 80
          ),
          child:  Text('Create Account',
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
              Get.to(ButtomBarPages());
            },
          ),

            TextButton(
              onPressed: () {
               Get.to(LoginScrren());
              },
              child: Text('Already have an account? Login',style: TextStyle(
                color: Colors.black,

              ),),
            ),
          ],
        ),
      ),
      ));
  }
}