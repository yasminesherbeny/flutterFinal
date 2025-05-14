import 'package:flutter/material.dart';

class myseason extends StatelessWidget {

 final String url;
 final String text;
  const myseason({required this.text ,required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
          
            alignment: Alignment.bottomCenter,
            
            children: [
            Image.asset(
              height:100,
              width:100,
              fit: BoxFit.cover,
              url),
          
              Text(text, style: TextStyle(color:Colors.white,fontSize: 25),)
          ],);
  }
}