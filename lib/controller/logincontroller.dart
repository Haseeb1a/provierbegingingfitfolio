import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workouttraker/bottom_main.dart';
import 'package:workouttraker/function/db_person.dart';
import 'dart:io';
import 'package:workouttraker/model/person_model/persondata.dart';
import 'package:workouttraker/view/screens_wtg/task_wtd.dart';
class PersonProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final personheightController = TextEditingController();
  final personweightController = TextEditingController();
  final personageController = TextEditingController();



  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> onAddTaskButtonPressed(BuildContext context) async {
    final personname = nameController.text.trim();
    final personheight = personheightController.text.trim();
    final personweight = personweightController.text.trim();
    final personage = personageController.text.trim();

    if (personname.isEmpty ||
        personage.isEmpty ||
        personheight.isEmpty ||
        personweight.isEmpty) {
      return;
    }

    final task = persondata(
      personname: personname,
      personage: personage,
      personweight: personweight,
      personheight: personheight,
      
    );

    addperson(task); // Assuming addperson is an asynchronous function
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ScreeenHome()),
    );
  }

}