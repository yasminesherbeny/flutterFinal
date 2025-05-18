import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_item/item_model.dart';



import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';

import 'dashboard/nav_bar.dart';
import 'favorite/favorite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
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
    , child: MyApp(isLoggedIn: isLoggedIn)

    ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key , required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home:isLoggedIn ? const NavBar() : const LoginPage(),
    );
  }
}

