
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zezo/Core/Home_Screen.dart';
import 'package:zezo/Screens/Clients/Add_client.dart';
import 'package:zezo/Widgets/Client_list_Widget.dart';

class ClientList extends StatefulWidget {
    const ClientList({super.key});

    @override
    State<ClientList> createState() => _ClientListState();
  }

  class _ClientListState extends State<ClientList> {
    
    
    void NavigateToAddClientScreen ()
    {
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>AddClient()), (route) => false) ;
    }
    
    
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("العملاء"),
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
          NavigateToAddClientScreen();
        } , child: Icon(Icons.add),),
        body: ClientListWidget()  ,
      );
    }
  }
