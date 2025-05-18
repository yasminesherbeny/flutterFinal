import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_item/add_item_screen.dart';
import 'package:flutter_application_1/add_item/item_model.dart';
import 'package:flutter_application_1/profile/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';

import '../details_widgets/favorite.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    final selectedItem = items.selectedItem!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: profileImage == null
                ? const Icon(Icons.account_box)
                : CircleAvatar(
              backgroundImage: FileImage(profileImage),
            ),
          ),
        ],
        centerTitle: true,
        title: Text("The ${selectedItem.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (selectedItem.images.isNotEmpty)
              Image.file(
                selectedItem.images.first,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(index: items.items.indexOf(selectedItem)),
                IconButton(
                  onPressed: () {
                    // Add share functionality here
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedItem.body,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: selectedItem.images.length,
                itemBuilder: (context, index) => Image.file(
                  selectedItem.images[index],
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdditemScreen()),
          );
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}