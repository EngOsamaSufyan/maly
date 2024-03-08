import 'package:flutter/material.dart';
import 'package:maly/pages/buttom_navegetor_bar.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

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

            const SizedBox(height: 45,),
            MaterialButton(
                elevation: 5.0,
                color: Colors.green,
                padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 80
                ),
                child: const Text('Reset Password',
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

                }
            ),


          ],
        ),
      ),
    );
  }
}