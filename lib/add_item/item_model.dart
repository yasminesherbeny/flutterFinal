import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/add_item/item.dart';
import 'package:image_picker/image_picker.dart';
import 'item.dart';

class ItemModel extends ChangeNotifier {

  final List <Item> _items = [];

  List <Item> get items => _items ;


 void addItem (Item item){
_items.add(item) ;
notifyListeners() ;



}
  ImagePicker imagePicker = ImagePicker();

  List <File> ? selectedImage = [] ;

  Future<void> imageSelector( ) async {

    List< XFile> ? image =   await imagePicker.pickMultiImage();

    if (image != null ) {




        selectedImage!.addAll(image.map((toElement)=> File(toElement!.path)).toList());

    }
notifyListeners();

  }

  void removeImage (index) {

      selectedImage!.removeAt
        (index);

      notifyListeners();

  }

  Item ? _selectedItem ;
  Item ? get selectedItem => _selectedItem ;


void selectItem (Item item){
  _selectedItem= item ;
  notifyListeners();
}






}