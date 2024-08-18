import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zezo/Auth/Login_Screen.dart';
import 'package:zezo/Routing/App_Router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( Zezo(appRouter:AppRouter() ,));
}

class Zezo extends StatelessWidget {
  const Zezo({super.key,   required this.appRouter});

 final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      title: 'zezo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,


        appBarTheme: AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.indigo,

            statusBarIconBrightness: Brightness.light
          ),

          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            fontStyle: FontStyle.italic,
          ),

        ),
        inputDecorationTheme: InputDecorationTheme(

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white
            )



          ),

        )
      ),
   onGenerateRoute: appRouter.genereteRoute ,
    );
  }
}

