import 'dart:io';

import 'package:flutter/material.dart';

class options extends StatelessWidget {
   final title;
   final IconData icon;
   Colors? color;

    File ? selectedImage;

   VoidCallback onpressed;

   options({ this.selectedImage,required this.onpressed,this.color ,required this.title,required this.icon,     super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [

                IconButton(
                  color: selectedImage ==null? Colors.grey.shade800 : Colors.red,
                  onPressed:(){} , icon: Icon(icon)),
                Text(title , style: TextStyle(color: selectedImage ==null? Colors.grey.shade800 : Colors.red),)


              ],
              );
  }
}