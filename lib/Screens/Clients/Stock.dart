
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zezo/Screens/Clients/Add_Product.dart';
import 'package:zezo/Widgets/Stock_widget.dart';

import '../../Core/Home_Screen.dart';

class Stock extends StatefulWidget {
    const Stock({super.key});

    @override
    State<Stock> createState() => _StockState();
  }

  class _StockState extends State<Stock> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text("المخزن"),
            centerTitle: true,
            leading: GestureDetector(
                onTap: ()
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();
                  }), (route) => false);
                },
                child: Icon(Icons.arrow_back , color: Colors.white,))
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (_){
                return AddProduct();
              }
          ));
        } , child: Icon(Icons.add),),
        body: StockWidget(),
      );
      
    }
  }
