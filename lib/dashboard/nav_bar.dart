import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';
import 'package:flutter_application_1/quote/quote_screen.dart';

import '../favorite/favorite_screen.dart';
import 'dashboard_screen.dart';




class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: [
        DashboardScreen(),
        FavoriteScreen(),
        ProfilePage(),
        QuoteScreen(),


      ][_selectedIndex],









      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index){
            setState(() {
              _selectedIndex=index;
            });

          },









          destinations: [
            NavigationDestination(icon: Icon(Icons.dashboard), label: "dashboard"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "favorite"),
            NavigationDestination(icon: Icon(Icons.person), label: "person"),
             NavigationDestination(icon: Icon(Icons.format_quote), label: "Quote"),
          ]























      ),










































































    );
  }
}
