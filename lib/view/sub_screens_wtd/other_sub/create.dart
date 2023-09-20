import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:workouttraker/function/db_functions.dart';
import 'package:intl/intl.dart';
import 'package:workouttraker/helpers/appcolors..dart';
import 'package:workouttraker/model/task_model/workoutmodel1.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:workouttraker/bottom_main.dart';
import 'package:workouttraker/controller/taskaddcontroller.dart';

class Textng extends StatefulWidget {
  const Textng({super.key});

  @override
  State<Textng> createState() => _TextngState();
}

class _TextngState extends State<Textng> {

 

  @override
  void initState() {
     final addtask = Provider.of<Taskaddingprovider>(context,listen: false);
    super.initState();
   addtask. dropdownController.text = addtask.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    final addtask = Provider.of<Taskaddingprovider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primarytheme,
        title: const Text('addTask'),
      ),
      body: AlertDialog(
        backgroundColor: colors.secondarytheme,
        content: SizedBox(
          height: double.infinity,
          child: Form(
            key: addtask.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: addtask.typenameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'TYPE NAME',
                      filled: true,
                      fillColor:colors.whitetheme,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: addtask.validateTextField,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: addtask.weightController,
                    maxLength: 3,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'KG',
                      filled: true,
                      fillColor:colors.whitetheme,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: addtask.repsController,
                    maxLength: 3,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'SETS',
                      filled: true,
                      fillColor:colors.whitetheme,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: addtask.validateTextField,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: addtask.setsController,
                    maxLength: 3,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'REPS',
                      filled: true,
                      fillColor:colors.whitetheme,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: addtask.validateTextField,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: addtask.dateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'DATE',
                      prefixIcon: const Icon(Icons.calendar_today),
                      filled: true,
                      fillColor:colors.whitetheme,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      addtask.selectDate(context);
                    },
                    validator: addtask.validateTextField,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 55,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsetsDirectional.all(3),
                          borderRadius: BorderRadius.circular(15),
                          value: addtask. dropdownController.text,
                          items: <String>['Day', 'Week', 'Month']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 15),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                          addtask. dropdownController.text = newValue!;
                              addtask.updateSelectedValue(newValue);
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              addtask.onAddTaskButtonPressed(context);
              addtask.typenameController.clear();
              addtask.dateController.clear();
              addtask.setsController.clear();
              addtask.repsController.clear();
              addtask. dropdownController.clear();
            },
            color: Colors.white,
            child: const Text('ADD'),
          )
        ],
      ),
    );
  }
}
