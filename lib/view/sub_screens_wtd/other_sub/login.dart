import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../controller/logincontroller.dart';
import '../../../function/db_person.dart';
import 'package:workouttraker/bottom_main.dart';
import 'package:workouttraker/model/person_model/persondata.dart';
import 'package:flutter/services.dart';
import 'package:workouttraker/helpers/appcolors..dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final login=Provider.of<PersonProvider>(context);
    return Scaffold(
       
      backgroundColor:colors.primarytheme,
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Form(
              key: login.formKey,
              child: SingleChildScrollView(
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Center(
                    child: Lottie.asset('assets/images/datas.json.json'),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: login.nameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              filled: true,
                              fillColor: const Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: login.validateTextField,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            maxLength: 3,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                            ],
                            controller: login.personheightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Weight',
                              filled: true,
                              fillColor: const Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: login.validateTextField,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            maxLength: 3,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                            ],
                            controller: login.personweightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Height',
                              filled: true,
                              fillColor: const Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: login.validateTextField,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            maxLength: 3,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                            ],
                            controller: login.personageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Age',
                              filled: true,
                              fillColor: const Color.fromARGB(255, 255, 255, 255),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: login.validateTextField,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                if (login.formKey.currentState!.validate()) {
                                  login.onAddTaskButtonPressed(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------ep

