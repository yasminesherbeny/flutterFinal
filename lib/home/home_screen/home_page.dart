import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstscreen.dart';
import 'package:flutter_application_1/profile/user_model.dart';

import 'package:provider/provider.dart';

import 'package:flutter_application_1/home/home_widgets/home_widgets.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';


class MyHomePage extends StatelessWidget {

  final String ? title;
  final String ?  body;
  final List<File> ? image;

  const MyHomePage({ this.image,this.title,  this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final profileimage =Provider.of<UserModel>(context,).user?.image;
    return  Scaffold (
      appBar: AppBar(
        actions: [IconButton(onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
         }, icon:profileimage == null? Icon(Icons.account_box):CircleAvatar(child: ClipOval(child: Image.file(profileimage,height: 50,width: 50,fit: BoxFit.cover,),),))],
        centerTitle: true,
        title: Text("The ${title ?? "tree"} ")),

      body: SingleChildScrollView(
        child: Column(children: [
        
         image == null|| image!.isEmpty ?     Image.asset("assets/tree.jpg"): Image.file(image![0],height: 300,fit: BoxFit.cover,width: double.infinity,),
        
         
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                
                favoritewidget(),
                IconButton(onPressed:(){}, icon: Icon(Icons.share)),
                
              ],),
          
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(
            
            body ?? "this is the body",
            textAlign: TextAlign.justify,
            ),
         ),
        
        
        image == null|| image!.isEmpty ?    Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           myseason(url:"assets/tree2.jpg",text:"fall"),
           myseason(url:"assets/tree3.jpg",text:"spring"),
           
          ],
        ):
        SizedBox(height: 500,
          child: GridView.builder(
          
            itemCount: image!.length,
            itemBuilder: (context, index) => Image.file(image ! [index],height: 100,width: 200,fit: BoxFit.cover,),
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,)),
        ),
        
        
        ],),
      ),


      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(context,MaterialPageRoute(builder: (context)=> Firstscreen()));
      },child: Icon(Icons.next_plan),),
    );
  }
}


