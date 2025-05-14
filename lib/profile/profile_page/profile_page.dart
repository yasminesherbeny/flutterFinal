import 'dart:io';
import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile/profile_widget/options.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("profile"),),

      body: Column(children: [
        Center(child: Consumer <UserModel>(
          builder: (context, UserModel, child) 
           {
            return  Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                radius: 100,
                child: 
                
                UserModel.user?.image == null ?
          
                
                Icon(Icons.person,size: 200,color: Colors.white,) : ClipOval(child: Image.file(
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
          
                  UserModel.user!.image !))
                ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
               child: IconButton(
                onPressed: (){
                showModalBottomSheet(context: context, builder: (context)=> SizedBox(
                  height: 150,
                   child: Column(children: [Text("profile" ,style: TextStyle(fontSize: 25),),
          
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
          
                  options(title: "camera",icon: Icons.camera_alt, onpressed: () {UserModel. imageSelector(ImageSource.camera); 
                  Navigator.pop(context);
                  },),
                  options(selectedImage: UserModel.user!.image ,title: "gallery",icon: Icons.image,
                   onpressed: () { UserModel. imageSelector(ImageSource.gallery);
                   Navigator.pop(context);
                   
                    },),
                  
                  if (UserModel.user?.image != null)
                    options(selectedImage: UserModel.user?.image,title: "delete",icon: Icons.delete, onpressed: () { 
                      UserModel.removeImage();
                      
                                            Navigator.pop(context);
          
                     },)
                  
                  ,
                ],
                ),
          
          
                ],)
                
                  
                ));
          
               
          
               }, icon: Icon(color: Colors.grey, Icons.camera_alt,size: 40,)))
            ],
          );
           }
        )
        )
            , ListTile(
              title: Text("name"),
              subtitle: Text("yasmine mohamed"),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text("bio"),
              subtitle: Text("this is my bio"),
              leading: Icon(Icons.info),
            ),


      ],
      ),


    );
  }
}



