import 'package:flutter/material.dart';
import 'package:workouttraker/function/db_functions.dart';
import 'package:workouttraker/helpers/appcolors..dart';
import 'package:workouttraker/view/screens_wtg/chart_wdt.dart';
import 'package:workouttraker/view/screens_wtg/mainpage.dart';
import 'package:workouttraker/view/screens_wtg/settings_wdt.dart';
import 'package:workouttraker/view/screens_wtg/task_wtd.dart';

class ScreeenHome extends StatefulWidget {
  const ScreeenHome({super.key});

  @override
  State<ScreeenHome> createState() => _ScreeenHomeState();
}

class _ScreeenHomeState extends State<ScreeenHome> {
 int _currentSelectIndex= 0;
 final _pages=[
   const HomeScreen(),
    Chart(
    checkboxStatus: false, // Set the default value here
    currentDate: DateTime.now(),
  ),
  const Task(),
  const Settings(),
 
 ];
  @override
  Widget build(BuildContext context) {
    getAllTasks();
    return Scaffold(
      
      // backgroundColor: colors.primarytheme,
      body: _pages[_currentSelectIndex],
      bottomNavigationBar: BottomNavigationBar(backgroundColor:colors.primarytheme, selectedItemColor: colors.secondarytheme,unselectedItemColor: colors.whitetheme,currentIndex: _currentSelectIndex,onTap:(newindex){
        setState(() {
          _currentSelectIndex=newindex;
        });
        } , items: const [
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Exercises',backgroundColor:colors.primarytheme,  tooltip: 'Go to Home',),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Progress',backgroundColor:colors.primarytheme),
        BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined), label: 'Task',backgroundColor:colors.primarytheme),
         BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',backgroundColor:colors.primarytheme),


      ]),
    );
  }
}



