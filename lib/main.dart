import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_item/item_model.dart';



import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';

import 'dashboard/nav_bar.dart';
import 'favorite/favorite_model.dart';

void main() {
  runApp(
    MultiProvider(

      providers: [

    ChangeNotifierProvider(
      create: (context)=> UserModel(),),
        ChangeNotifierProvider(
          create: (context)=> ItemModel(),),
        ChangeNotifierProvider(
          create: (context)=> FavoriteModel(),),


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

