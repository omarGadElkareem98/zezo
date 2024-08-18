
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zezo/Core/Home_Screen.dart';
import 'package:zezo/Screens/Clients/Clients_list.dart';

class AddClient extends StatelessWidget {
     AddClient({super.key});


     var formKey = GlobalKey<FormState>();

    TextEditingController _clientnameController = TextEditingController();
    TextEditingController _clientPhonenumberController = TextEditingController();
    TextEditingController _detailsController = TextEditingController();

    FirebaseFirestore _firestore = FirebaseFirestore.instance;

      CollectionReference clients = FirebaseFirestore.instance.collection("clients");




    void SavenewClient (context) async
    {
     clients.add({
       "name" : _clientnameController.text,
       "phoneNumber" : _clientPhonenumberController.text,
       "detail" : _detailsController.text,
     }).then((value) =>  AwesomeDialog(
       context: context,
       dialogType: DialogType.success,
       animType: AnimType.rightSlide,
       title: 'تم اضافه العميل بنجاج  ',
       desc: 'اضافه عميل جديد.............',
       btnCancelOnPress: () {},
       btnOkOnPress: () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
           return ClientList();
         }));
       },
     )..show() ).catchError((error)=> AwesomeDialog(
         context: context,
       dialogType: DialogType.error,
       animType: AnimType.rightSlide,
       title: 'حصل حطا ما    ',
       desc: 'اضافه عميل جديد.............',
       btnCancelOnPress: () {},
       btnOkOnPress: () {},

     )..show() );
    }

    @override

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("اضافه عميل جديد"),
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
            child: Column(
              children: [
                SizedBox(height: 30,),
                TextFormField(
                  controller: _clientnameController,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      {
                        return "ادحل اسم العميل";
                      }
                  },

                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "اسم العميل",
                    label: Text("اسم العميل",)

                  ),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  controller: _clientPhonenumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return "ادحل رقم العميل";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "  رقم تلفون العميل",
                      label: Text("  رقم تلفون العميل")

                  ),
                ),
                SizedBox(height: 12,),

                TextFormField(
                  controller: _detailsController,
                  decoration: InputDecoration(
                      hintText: " تفاصيل ",
                      label: Text("تفاصيل ",)

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
                          SavenewClient(context);
                        }

                    } ,
                    child: Text("حفظ العميل" , style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
