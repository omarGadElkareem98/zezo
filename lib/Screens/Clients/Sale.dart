
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zezo/Core/Home_Screen.dart';
import 'package:zezo/Screens/Clients/Sale_Widget.dart';

class SaleScreen extends StatefulWidget {
    const SaleScreen({super.key});

    @override
    State<SaleScreen> createState() => _SaleScreenState();
  }

  class _SaleScreenState extends State<SaleScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("بيع"),
          centerTitle: true,
          leading: GestureDetector(
            onTap: ()
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                return HomeScreen();
              }));
            },
              child: Icon(Icons.arrow_back)),

        ),
        body: SaleWidget(),
      );
    }
  }
