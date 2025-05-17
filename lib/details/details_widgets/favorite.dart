import 'package:flutter/material.dart';

class favoritewidget extends StatefulWidget {
  const favoritewidget({super.key});

  @override
  State<favoritewidget> createState() => _favoritewidgetState();
}

class _favoritewidgetState extends State<favoritewidget> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return  IconButton(onPressed: () { 
      setState(() {
        click =! click;
      });
    },icon: Icon(Icons.favorite, color: click ? Colors.red :Colors.grey,),);
  }
}