import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_main.dart';
import '../function/db_functions.dart';
import '../model/task_model/workoutmodel1.dart';

class Taskaddingprovider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final typenameController = TextEditingController();
  final weightController = TextEditingController();
  final repsController = TextEditingController();
  final setsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dropdownController = TextEditingController();
  String selectedValue = 'Day';

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners(); // Notify listeners after updating the data
    }
  }
 

  String get selectedValues => selectedValue;

  void updateSelectedValue(String newValue) {
    selectedValue = newValue;
    notifyListeners();
  }

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> onAddTaskButtonPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      // Validation successful, proceed to add task
      final typename = typenameController.text.trim();
      final weight = weightController.text.trim();
      final sets = setsController.text.trim();
      final reps = repsController.text.trim();
      final date = DateTime.parse(dateController.text.trim());
      final duration = dropdownController.text.trim();

      final task = Workoutmodel(
        typename: typename,
        weight: weight,
        reps: reps,
        sets: sets,
        date: date,
        duration: duration,
      );

       addTask(task);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScreeenHome()),
      );
    }
  }
}
