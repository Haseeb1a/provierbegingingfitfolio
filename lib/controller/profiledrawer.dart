import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  Future<void> pickImageAndStore() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
        notifyListeners();

        // Store the image path in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('profile_image', pickedImage.path);
      }
    } catch (e) {
      // Handle any exceptions here
    }
  }
}