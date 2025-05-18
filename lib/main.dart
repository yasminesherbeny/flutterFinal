import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_item/item_model.dart';
import 'package:flutter_application_1/dashboard/dashboard_screen.dart';
import 'package:flutter_application_1/add_item/add_item_screen.dart';
import 'package:flutter_application_1/details/details_screen/details_page.dart';
import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(

      providers: [

    ChangeNotifierProvider(
      create: (context)=> UserModel(),),
        ChangeNotifierProvider(
          create: (context)=> ItemModel(),),


      ]
    , child:const MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: NavBar(),
    );
  }
}

