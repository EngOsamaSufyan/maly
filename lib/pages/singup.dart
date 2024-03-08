import 'package:flutter/material.dart';

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
          const SizedBox(height: 10),

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
          const SizedBox(height: 45,),
          MaterialButton(
          elevation: 5.0,
          color: Colors.green,
          padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 80
          ),
          child: const Text('Create Account',
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return  ButtomBarPages();
          }));
          }
          ),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
      ));
  }
}