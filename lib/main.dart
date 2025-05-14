import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstscreen.dart';
import 'package:flutter_application_1/home/home_screen/home_page.dart';
import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> UserModel(),
    child:const MyApp() ,
    )
    );
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
      home: MyHomePage(),
    );
  }
}

