import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maly/pages/loginpage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../maly_db/db.dart';
import 'buttom_navegetor_bar.dart';
import 'nav.dart';



class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController personalCardController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  File? _frontcard;
  File? _backcard;
  File? _selfy;



  Future getfront ()async{
    final fimg = await ImagePicker().pickImage(source: ImageSource.camera);
    if (fimg == null)return;
    final imgtemp =File(fimg.path);

    setState(() {
      _frontcard =imgtemp;
    });
  }
  Future getback ()async{
    final bimg = await ImagePicker().pickImage(source: ImageSource.camera);
    if (bimg == null)return;
    final imgtemp =File(bimg.path);

    setState(() {
      _backcard =imgtemp;
    });
  }
  Future getselfy ()async{
    final simg = await ImagePicker().pickImage(source: ImageSource.camera);
    if (simg == null)return;
    final imgtemp =File(simg.path);

    setState(() {
      _selfy =imgtemp;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(

                padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 2),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
            children: <Widget> [
              Container(
                width:450,
                height: 150,
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

            const SizedBox(height: 10,),
            TextField(
              controller: nameController,
            decoration: InputDecoration(
            hintText: 'Name',
            prefixIcon: Icon(Icons.person,color: Colors.orange,),
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
                controller: phoneNumberController,
      
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_android,color: Colors.orange,),
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
                controller: personalCardController,

                decoration: InputDecoration(
                  hintText: 'Prosnal Card ',

                  prefixIcon: Icon(Icons.credit_card,color: Colors.orange,),
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
              controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.remove_red_eye,color: Colors.orange,),
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
              SizedBox(height: 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ MaterialButton (
                      onPressed: () {
                        getfront();
                        // Add your button action here
                      },
                      child: Icon(Icons.credit_card,color: Colors.orange,),
                    ),
                      Text('Front Card:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 103,
                        child:  _frontcard != null? Image.file(_frontcard!):Container(),
                      )
                    ]),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
      
                      MaterialButton (
                        onPressed: () {
                          getback();
                          // Add your button action here
                        },
                        child: Icon(Icons.credit_card_outlined,color: Colors.orange,),
                      ),
                      Text('Back Card:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 107,
                        child:  _backcard != null? Image.file(_backcard!):Container(),
                      )
                    ]),
                ],
              ),
              SizedBox(height: 4),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 MaterialButton (
                   onPressed: () {
                     getselfy();
                     // Add your button action here
                   },
                   child: Icon(Icons.camera,color: Colors.orange,),
                 ),
                 Text('Selfy:',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Container(
                   height: 70,
                   width: 200,
                   child:  _selfy != null? Image.file(_selfy!):Container(),
                 )
               ],
             ),
             SizedBox(height: 45,),
            MaterialButton(
            elevation: 5.0,
            color: Colors.orange[900],
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
                String name = nameController.text;
                String phoneNumber = phoneNumberController.text;
                String personalCard = personalCardController.text;
                String password = passwordController.text;

                if (name.isEmpty ||
                    phoneNumber.isEmpty ||
                    personalCard.isEmpty ||
                    password.isEmpty||
                    _frontcard == null ||
                    _backcard == null ||
                    _selfy == null
                ) {
                  // Display an error dialog if any field is empty or any image is missing
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all fields and capture all images.'),
                      );
                    },
                  );
                  return; // Exit the function early if there is an error
                }
                setState(() {
                  nameController .clear();
                  phoneNumberController.clear();
                  personalCardController.clear();
                  passwordController.clear();
                });
                // Create a map of user data
                final user = {
                  'name': name,
                  'number': phoneNumber,
                  'personalCard': personalCard,
                  'password': password,
                  'photo1': _frontcard?.path ?? '',
                  'photo2': _backcard?.path ?? '',
                  'photo3': _selfy?.path ?? '',
                };

                // Insert the user into the database
                final userId = await MyDatabase.insertUser(user);

                if (userId != -1) {
                  // Display a success dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content:   Container(
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
                } else {
                  // Display a failure dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Icon(
                          Icons.disabled_by_default,
                          size: 100,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                }

                // Delay the dialog dismissal for 1 second
                await Future.delayed(Duration(seconds: 2));
                Get.to(ButtomBarPages());
              },
            ),
      
              TextButton(
                onPressed: () {
                 Get.to(LoginScrren());
                },
                child: Text('Already have an account? Login',style: TextStyle(
                  color: Colors.blue,
      
                ),),
              ),

            ],
          ),
        ),
        )),
    );
  }
}