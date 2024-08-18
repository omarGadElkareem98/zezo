
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Core/Home_Screen.dart';
import 'Stock.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var formKey = GlobalKey<FormState>();

  TextEditingController _productnameController = TextEditingController();
  TextEditingController _priceproductController = TextEditingController();
  TextEditingController _PurchasingpriceController = TextEditingController();
  TextEditingController _QuantityproductController = TextEditingController();
  TextEditingController _AlertproductController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference products = FirebaseFirestore.instance.collection("products");




  void SaveNewProduct (context) async
  {
    products.add({
      "name" : _productnameController.text,
      "priceproduct" : _priceproductController.text,
      "Purchasingprice" : _PurchasingpriceController.text,
      "Quntityproduct": _QuantityproductController.text,
      "AlertProductnumber" : _AlertproductController.text
    }).then((value) =>  AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'تم اضافه الصنف بنجاج  ',
      desc: 'اضافه صنف جديد.............',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
         return Stock();
       }));
      },
    )..show() ).catchError((error)=> AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'حصل حطا ما    ',
      desc: 'اضافه صنف جديد.............',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},

    )..show() );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافه صنف جديد"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: ()
            {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                return HomeScreen();
              }) , (route) => false);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  controller: _productnameController,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return "ادحل اسم الصنف";
                    }
                  },
            
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "اسم الصنف",
                      label: Text("اسم الصنف",)
            
                  ),
                ),
                SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   width: double.infinity,
                   child: Row(
                     children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextFormField(
                             controller: _priceproductController,
                             keyboardType: TextInputType.phone,

                             validator: (value)
                             {
                               if(value!.isEmpty)
                               {
                                 return "ادحل  سعر الصنف";
                               }
                             },
                             decoration: InputDecoration(
                                 hintText: " سعر بيع الصنف",
                                 label: Text(" سعر بيع الصنف   ")
            
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Expanded(
                         child: TextFormField(
                           controller: _PurchasingpriceController,
                           keyboardType: TextInputType.phone,
                           validator: (value)
                           {
                             if(value!.isEmpty)
                             {
                               return "ادحل  سعر الصنف";
                             }
                           },
                           decoration: InputDecoration(
                               hintText: " سعر شراء الصنف",
                               label: Text(" سعر شراء الصنف   ")
            
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _QuantityproductController,
                              keyboardType: TextInputType.phone,
                              validator: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return "ادحل  سعر الصنف";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: " كميه المخزون  ",
                                  label: Text("   كميه المخزون   ")
            
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: TextFormField(
                            controller: _AlertproductController,
                            keyboardType: TextInputType.number,
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "ادحل  سعر الصنف";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: " تنبيه انخفاض المخزون ",
                                label: Text(" تنبيه انخفاض المخزون ")
            
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(32)
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      if(formKey.currentState!.validate())
                      {
                        SaveNewProduct(context);
                      }
            
                    } ,
                    child: Text("اضافه الصنف" , style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
