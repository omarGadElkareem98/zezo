
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zezo/Screens/Clients/Clients_list.dart';
import 'package:zezo/Screens/Clients/Sale.dart';
import 'package:zezo/Screens/Clients/Stock.dart';
import 'package:zezo/Widgets/Category_widget.dart';

import '../Screens/Clients/Add_Product.dart';

class HomeScreen extends StatefulWidget {
  static const idScreen = "home";
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    String UrlImage = "https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          title: Text("ZEZO"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1509017174183-0b7e0278f1ec?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),fit: BoxFit.cover)
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),





                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(

                      child: Column(
                        children: [




                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: ()
                                {
                                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ClientList()), (route) => false);
                                },
                                  child: CategoryItem(ImageUrl: 'https://icons.veryicon.com/png/o/business/merchant/my-client-3.png', text: 'العملاء')),
                              GestureDetector(
                                onTap: ()
                                {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                                    return SaleScreen();
                                  }));
                                },
                                  child: CategoryItem(ImageUrl: 'https://media.istockphoto.com/id/1256489977/vector/tasks-check-checklist-blue-icon.jpg?s=1024x1024&w=is&k=20&c=F2RbyDG5huCihzFdHYnrvhkYrp7ijfwD4dqp08ywiQ8=', text: 'بيع')),

                              InkWell(
                                onTap: ()
                                  {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                                      return Stock();
                                    }), (route) => false);
                                  },
                                  child: CategoryItem(ImageUrl: 'https://media.istockphoto.com/id/1211747338/vector/profit-analysis-icon-earning-growth.jpg?s=1024x1024&w=is&k=20&c=fjSd0m3NkF0EtSq6J3x7brzpJ8WxU-JJNrOYn5gK9n8=', text: 'المخزن')),
                            ],
                          ),
                          const     SizedBox(height: 18,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: ()
                                  {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>ClientList()), (route) => false);
                                  },
                                  child: CategoryItem(ImageUrl: 'https://media.istockphoto.com/id/1303877287/vector/paper-checklist-and-pencil-flat-pictogram.jpg?s=1024x1024&w=is&k=20&c=jO4_81cpz6gyFCd_TyHbfqkxuIOBm2xoLTwtvP4TKY0=', text: 'مبيعاتي') ),
                              GestureDetector(
                                  onTap: ()
                                  {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                                      return AddProduct();









                                    }));
                                  },
                                  child: CategoryItem(ImageUrl: 'https://media.istockphoto.com/id/1727971517/vector/hand-holding-money-icon.jpg?s=1024x1024&w=is&k=20&c=CkygK_11XOxbVH2IUERa9VmJoWGvtb6BrYFfVYyOSiU=', text: 'الايرادات')),


                            ],
                          ),





                        ],
                      ),
                    ),
                  )

                ],
              )
          ),
        ),
      );
    }
  }
