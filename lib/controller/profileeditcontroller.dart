import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profileeditprovider with ChangeNotifier {
//    final String personname;
//   final String personage;
//   final String personweight;
//   final String personheight;
//   final String? personImage;
//   final int index;
//  Profileeditprovider({
//     Key? key,
//     required this.personname,
//     required this.personage,
//     required this.personheight,
//     required this.index,
//     required this.personweight,
//     this.personImage,
    
//   });

final formKey = GlobalKey<FormState>();
  final personnamecontroller = TextEditingController();
  final wpersonageController = TextEditingController();
  final personweightController = TextEditingController();
  final personheightController = TextEditingController();
  final imageController = TextEditingController();

   String? _profileImagePath;

  String? get profileImagePath => _profileImagePath;

  Future<void> loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    _profileImagePath = imagePath;
    notifyListeners(); // Notify listeners after updating the data
  }


}