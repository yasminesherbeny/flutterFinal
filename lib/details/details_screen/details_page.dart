import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_item/add_item_screen.dart';
import 'package:flutter_application_1/add_item/item_model.dart';
import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/details/details_widgets/details_widgets.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';


class DetailsPage extends StatelessWidget {

  // final String ? title;
  // final String ?  body;
  // final List<File> ? image;

  const DetailsPage({
  // this.image,this.title,  this.body,
    super.key});

  @override
  Widget build(BuildContext context) {
    final profileimage =Provider.of<UserModel>(context).user?.image;
    final items =Provider.of<ItemModel>(context);
    return  Scaffold (
      appBar: AppBar(
        actions: [IconButton(onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
         }, icon:profileimage == null? Icon(Icons.account_box):CircleAvatar(
          child: ClipOval(
            child: Image.file(
              profileimage,height: 50,width: 50,fit: BoxFit.cover,),),))],
        centerTitle: true,
        title: Text("The ${items.selectedItem!.title} ")),

      body: SingleChildScrollView(
        child: Column(children: [
        // image == null|| image!.isEmpty ?     Image.asset("assets/tree.jpg"):

          Image.file( items.selectedItem!.images.first,height: 300,fit: BoxFit.cover,width: double.infinity,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                
                favoritewidget(),
                IconButton(onPressed:(){}, icon: Icon(Icons.share)),
                
              ],),
          
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(

               items.selectedItem!.body
             //   ?? "this is the body",textAlign: TextAlign.justify,
           ),),


        // image == null|| image!.isEmpty ?    Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //  children: [
          //   myseason(url:"assets/tree2.jpg",text:"fall"),
          //  myseason(url:"assets/tree3.jpg",text:"spring"),

        //    ],
          //  ):

        SizedBox(height: 500,
          child: GridView.builder(
          
            itemCount: items.selectedItem!.images.length,
            itemBuilder: (context, index) => Image.file(items.selectedItem!.images[index],height: 100,width: 200,fit: BoxFit.cover,),
            
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,)),
        ),
        
        
        ],),
      ),


      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.push(context,MaterialPageRoute(builder: (context)=> AdditemScreen()));
      },child: Icon(Icons.next_plan),),
    );
  }
}


