
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_item/item.dart';
import 'package:flutter_application_1/add_item/item_model.dart';
import 'package:flutter_application_1/details/details_screen/details_page.dart';
import 'package:flutter_application_1/add_item/add_item_screen.dart';
import 'package:provider/provider.dart';
import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileimage =Provider.of<UserModel>(context,).user?.image;
    final items =Provider.of<ItemModel>(context);


    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),

        actions: [IconButton(onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        }, icon:profileimage == null? Icon(Icons.account_box):CircleAvatar(
          child: ClipOval(
            child: Image.file(
              profileimage,height: 50,width: 50,fit: BoxFit.cover
            ),
            ),
          )
        )
        ],

      ),

      body:
      GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,
            crossAxisSpacing: 10
          ) ,
      itemCount: items.items.length,
        itemBuilder: (context , index){
         return   InkWell(
           onTap: (){
             items.selectItem(Item(images: items.items[index].images, title: items.items[index].title, body: items.items[index].body, favorite: items.items[index].favorite));

             Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));

           },

           child: SizedBox (

             child: Column(
             children: [
             Image.file(items.items[index].images.first ,
                 height: 125, width: 200, fit:BoxFit.cover),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(items.items[index].title),
                 IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
               ],
             )

           ],),),
         );
        }
      
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AdditemScreen()));

      } , child: Icon(Icons.add),),


    );
  }
}
