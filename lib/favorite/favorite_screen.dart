import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorite/favorite_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),

      body:Consumer<FavoriteModel>(
        builder: (context , fav , child)
        => GridView.builder(
        
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ,
                crossAxisSpacing: 10
            ) ,
            itemCount: fav.fav.length,
            itemBuilder: (context , index){
              return   SizedBox(
                child: Column(
                    children: [
                      Image.file(fav.fav[index].images.first ,
                          height: 125, width: 200, fit:BoxFit.cover),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(fav.fav[index].title),
                          IconButton(onPressed: (){
                            fav.fav[index].favorite = false;

                          }, icon: Icon(Icons.favorite , color: Colors.red ,))
                        ],
                      )
        
                    ],),
              );
            }
        
        ),
      ),



    );
  }
}













