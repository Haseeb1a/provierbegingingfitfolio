import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TaskEditProvider extends ChangeNotifier {
  final TextEditingController typenameController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  // You can add more controllers for other fields as needed.

  void dispose() {
    typenameController.dispose();
    weightController.dispose();
    setsController.dispose();
    repsController.dispose();
    durationController.dispose();
    super.dispose();
  }
}
