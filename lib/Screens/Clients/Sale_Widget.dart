
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleWidget extends StatefulWidget {
    const SaleWidget({super.key});
  
    @override
    State<SaleWidget> createState() => _SaleWidgetState();
  }
  
  class _SaleWidgetState extends State<SaleWidget> {


    TextEditingController _productSaleController = TextEditingController();
    TextEditingController _priceSaleController = TextEditingController();
    TextEditingController _QuntaityController = TextEditingController();
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference productSale = FirebaseFirestore.instance.collection('productSale');

  void SaleProduct () async
  {
    productSale.add({
      "name" : _productSaleController.text,
      "price" : _priceSaleController.text,
      "Quntity" : _QuntaityController.text

    }).then((value) => AwesomeDialog(
        context: context,
        title: "عمليه بيغ",
        animType: AnimType.rightSlide,
        dialogType: DialogType.success,
        desc: "عمليه بيع منتج",
        btnOkOnPress: (){},
      btnCancelOnPress: (){}
    ));
  }


    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 15,),

            TextFormField(
              controller: _productSaleController,
              enabled: false,
              decoration: InputDecoration(
                hintText: "بيع صنف",






              ),
            ),

            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("300 جنيه" , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),),
                  Text(" اسم المنتج " ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),)
                ],
              ),
            ),
            Spacer(),
            Divider(thickness: 3, color: Colors.black,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("300 جنيه" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),),
                  Text("الاجمالي " ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),)
                ],
              ),
            ),
            SizedBox(height: 18,),
            Container(
              width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: MaterialButton(onPressed: (){
                  SaleProduct();
                } , child: Text("بيع منتج" , style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),))
          ],
        ),
      );
    }
  }
  