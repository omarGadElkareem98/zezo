
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zezo/Screens/Clients/Stock.dart';

class StockWidget extends StatefulWidget {
    const StockWidget({super.key});

    @override
    State<StockWidget> createState() => _StockWidgetState();
  }

  class _StockWidgetState extends State<StockWidget> {


    List Products = [];
    CollectionReference products = FirebaseFirestore.instance.collection("products");


    void getproducts () async {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('products').get();

      Products.addAll(querySnapshot.docs);

      setState(() {

      });

    }

    void deleteitem (index) async {
      await FirebaseFirestore.instance.collection("products").doc(Products[index].id).delete();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return Stock();
      }));
      
      
    }

    List NewProducts = [];
    void SrearchResults (String enteredKeyword){

      List reuslts = [];

      if(enteredKeyword.isEmpty){
        reuslts = Products;

      } else {
        reuslts = Products.where((product) => product['name']).toList();
      }
      setState(() {
        NewProducts = reuslts;
      });

    }


    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getproducts();
      NewProducts = Products;
    }

    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                hintText: "ابحث عن منتج",
               onTap: (){

               },

                textStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.white)
                ),
                hintStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.white)
                ),

                backgroundColor: MaterialStatePropertyAll(
                  Colors.black
                ),

              ),
            ),
            Products.isEmpty ? Center(child: Text("لا يوجد اصناف مضافه ف المخزن")) : SizedBox(
              height: 700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: Products.length,
                    itemBuilder: (context , index)
                    {
                      return Card(
                        color: Colors.black,
                        child: ExpansionTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("  ${Products[index]['name']}" , style: TextStyle(
                                  color: Colors.white
                              ),),
                              Icon(Icons.edit , color: Colors.blue,),
                              GestureDetector(
                                onTap: ()
                                {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.question,
                                    animType: AnimType.rightSlide,
                                    title: 'حذف الصنف',
                                    desc: 'هل انت متاكد من الحذف',
                                    btnCancelOnPress: () {

                                    },
                                    btnOkOnPress: () {
                                      deleteitem(index);
                                    },

                                  )..show();
                                },
                                  child: Icon(Icons.delete , color: Colors.red,))

                            ],
                          ) ,
                          children: [
                            Column(
                              children: [
                                Text(" الكميه :- ${Products[index]['Quntityproduct']}" , style: TextStyle(
                                    color: Colors.white
                                ),),
                                SizedBox(height: 15,),
                                Text(" سعر البيع :- ${Products[index]['priceproduct']}" , style: TextStyle(
                                    color: Colors.white
                                ),),
                                SizedBox(height: 15,),
                                Text(" سعر الشراء :- ${Products[index]['Purchasingprice']}" , style: TextStyle(
                                    color: Colors.white
                                ),),
                              ],
                            ),
                          ],

                        ),
                      );
                    }
                ),
              ),
            )
          ],
        ),
      );
    }
  }
