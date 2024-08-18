
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zezo/Auth/Login_Screen.dart';
import 'package:zezo/Core/Home_Screen.dart';
import 'package:zezo/Screens/Clients/Clients_list.dart';

class AppRouter
  {
    Route? genereteRoute (RouteSettings settings)
    {
      switch (settings.name)
      {
        case 'login_Screen' :
          return MaterialPageRoute(builder: (_) => LoginScreen());
        case '/':
          return MaterialPageRoute(builder: (_) => HomeScreen());
        case 'clients_list':
          return MaterialPageRoute(builder: (_)=> ClientList()  );


      }
    }
  }