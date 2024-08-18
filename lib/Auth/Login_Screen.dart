
  import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zezo/Core/Home_Screen.dart';


class LoginScreen extends StatefulWidget {


  static const idScreen = "login";

    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;





    loginUser ()
    {
      if(_emailController.text == "zezo12@gmail.com" && _passwordController.text=="1234567")
        {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'تم تسجيل الدخول بنجاح',
              desc: 'Login.............',
              btnCancelOnPress: () {},
      btnOkOnPress: () {},
      )..show();
          
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));



        } else
          {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              desc: 'Error.............',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          }
    }



    Widget build(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 180 , right: 30, left: 30),
          child: Column(
            children: [
              SizedBox(height: 40,),

              Text("ZEZo System" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
                SizedBox(height: 15,),
              TextFormField(
                controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email)
                  ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.password)
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(32)
                ),
                child: MaterialButton(
                  onPressed: (){
                    loginUser();
                  } ,
                  child: Text("Login" , style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
