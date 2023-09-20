import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workouttraker/helpers/appcolors..dart';
import 'package:workouttraker/view/sub_screens_wtd/settings_sub/about.dart';
import 'package:workouttraker/view/sub_screens_wtd/settings_sub/terms_&_condition.dart';
import 'package:workouttraker/utility/reset_function.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void clossAPP(){
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
              backgroundColor: colors.primarytheme,

        title: const Center(child: Text('Settings')),

      ),
      backgroundColor:  colors.whitetheme,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
            ),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const About(),));
              },
              child: Container(
                                 width: 360,
                                  height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  border: Border.all(
                                        width: 3.9,
                                        color:colors.primarytheme),
                                ),
      
                                child:const  Center(
      
                                  child: Text(
                                    'ABOUT',
                                    style: TextStyle(fontSize: 27,color:colors.whitetheme),
                                  ),
                                )),
            ),
             const SizedBox(
              height: 27,
            ),  GestureDetector(
                onTap:(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>const TermsAndCondtion(),));
                },
                child: Container(
                                  width: 360,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    border: Border.all(
                                      width: 3.9,
                                        color:colors.primarytheme),
                                  ),
      
                                  child: const Row(
      
      
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[  
                                      Text(
                                      'TERMS & CONDITIONS',
                                      style: TextStyle(fontSize: 27,color:colors.whitetheme),
              
                                    ),]
                                  )),
              ),  const SizedBox(
              height: 27,
            ), 
                              GestureDetector(
                               onTap: () {
                                 resetDB(context);
                               },
                                child: Container(
                                 width: 360,
                                  height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    border: Border.all(
                                      width: 3.9,
                                        color:colors.primarytheme),
                                  ),
                                    
                                    
                                  child: const Center(
                                    child: Text(
                                      'RESET',
                                      style: TextStyle(fontSize: 27,color: colors.whitetheme),
                                    ),
                                  ),
                                ),
                              ),
                               const SizedBox(
              height: 27,
            ),
                              GestureDetector(                            
                                onTap: () =>exit(0),
                                child: Container(
                                  width: 360,
                                  height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    border: Border.all(
                                      width: 3.9,
                                        color:colors.primarytheme),
                                  ),
                                    
                                child: const Center(
                                    
                                    
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('EXIT',
                                      
                                      style: TextStyle(fontSize: 27,color: colors.whitetheme),
                                      ),
                                      Icon(
                                        Icons.exit_to_app,size: 30,color: colors.whitetheme,
                                        // style: TextStyle(fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ),
          ]
                              
                              ),
      ),
    ); 
  }
}