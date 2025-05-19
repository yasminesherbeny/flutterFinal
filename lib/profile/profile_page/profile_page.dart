import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile/user_model.dart';
import 'package:flutter_application_1/providers/theme_provider.dart';
import 'package:provider/provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userModel = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                radius: 100,
                child: userModel.user?.image == null
                    ? const Icon(Icons.person, size: 200, color: Colors.white)
                    : ClipOval(
                        child: Image.file(
                          userModel.user!.image!,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: 150,
                        child: Column(
                          children: [
                            const Text(
                              "Profile",
                              style: TextStyle(fontSize: 25),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                options(
                                  title: "Camera",
                                  icon: Icons.camera_alt,
                                  onpressed: () {
                                    userModel.imageSelector(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  selectedImage: userModel.user?.image,
                                ),
                                options(
                                  title: "Gallery",
                                  icon: Icons.image,
                                  onpressed: () {
                                    userModel.imageSelector(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  selectedImage: userModel.user?.image,
                                ),
                                if (userModel.user?.image != null)
                                  options(
                                    title: "Delete",
                                    icon: Icons.delete,
                                    onpressed: () {
                                      userModel.removeImage();
                                      Navigator.pop(context);
                                    },
                                    selectedImage: userModel.user?.image,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text("Name"),
            subtitle: const Text("Yasmine Mohamed"),
            leading: const Icon(Icons.person),
          ),
          ListTile(
            title: const Text("Bio"),
            subtitle: const Text("This is my bio"),
            leading: const Icon(Icons.info),
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeProvider.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
            secondary: Icon(
              themeProvider.themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
    );
  }
}