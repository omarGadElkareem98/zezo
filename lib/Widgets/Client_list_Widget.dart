
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zezo/Screens/Clients/Clients_list.dart';

class ClientListWidget extends StatefulWidget {
    const ClientListWidget({super.key});

    @override
    State<ClientListWidget> createState() => _ClientListWidgetState();
  }

  class _ClientListWidgetState extends State<ClientListWidget> {

  List Clients = [];
  CollectionReference clients = FirebaseFirestore.instance.collection("clients");


  void getClientData () async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('clients').get();

    Clients.addAll(querySnapshot.docs);

    setState(() {

    });

  }
  void deleteitem (index) async {
    await FirebaseFirestore.instance.collection("clients").doc(Clients[index].id).delete();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
      return ClientList();
    }));


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClientData();
  }

  Future<void> makePhoneCall(  index) async {
    String phoneNumber = '${Clients[index]['phoneNumber']}';
    final Uri launchUri = Uri(

      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUri;
  }




    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                hintText: "ابحث عن عميل",

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
            SizedBox(
              height: 700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: Clients.length,
                    itemBuilder: (context , index)
                    {
                      return Card(
                        color: Colors.black,
                        child: ExpansionTile(
                          title: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${Clients[index]['name']}" , style: TextStyle(
                                color: Colors.white
                              ),),
                              GestureDetector(
                                onTap: (){
                                 makePhoneCall(index);
                                },
                                  child: Icon(Icons.call , color: Colors.blue,)),

                              GestureDetector(
                                  onTap: ()
                                  {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.question,
                                      animType: AnimType.rightSlide,
                                      title: 'حذف الاسم',
                                      desc: 'هل انت متاكد من الحذف',
                                      btnCancelOnPress: () {

                                      },
                                      btnOkOnPress: () {
                                        deleteitem(index);
                                      },

                                    )..show();
                                  },
                                  child: Icon(Icons.delete , color: Colors.red,)),
                            ],
                          ) ,
                          children: [
                            Column(
                              children: [
                                Text("  رقم الهاتف:- ${Clients[index]['phoneNumber']}" , style: TextStyle(
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
