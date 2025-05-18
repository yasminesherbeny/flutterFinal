import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorite/favorite_model.dart';
import 'package:provider/provider.dart';

import '../../add_item/item_model.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ItemModel, FavoriteModel>(
      builder: (context, itemModel, favoriteModel, child) {
        final currentItem = itemModel.items[index];
        return IconButton(
          onPressed: () {
            favoriteModel.isFavorite(currentItem);
          },
          icon: Icon(
            Icons.favorite,
            color: currentItem.favorite ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}