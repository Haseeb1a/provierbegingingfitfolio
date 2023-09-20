import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouttraker/controller/logincontroller.dart';
import 'package:workouttraker/controller/profiledrawer.dart';
import 'package:workouttraker/controller/taskaddcontroller.dart';
import 'package:workouttraker/controller/taskupdatecontroller.dart';
import 'package:workouttraker/controller/taskviewcontroller.dart';
import 'package:workouttraker/function/db_functions.dart';
import 'package:workouttraker/model/person_model/persondata.dart';
import 'package:workouttraker/model/task_model/workoutmodel1.dart';
import 'package:workouttraker/view/sub_screens_wtd/other_sub/splace.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/profileeditcontroller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(WorkoutmodelAdapter().typeId)) {
    Hive.registerAdapter(WorkoutmodelAdapter());
  }
  if (!Hive.isAdapterRegistered(persondataAdapter().typeId)) {
    Hive.registerAdapter(persondataAdapter());
  }
   await Hive.openBox<Workoutmodel>('workout_db');
   await Hive.openBox<persondata>('person_db');
   await getAllTasks();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

        ChangeNotifierProvider(create: (context) => PersonProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => Taskaddingprovider()),
        ChangeNotifierProvider(create: (context) =>Profileeditprovider()),
        ChangeNotifierProvider(create: (context) =>Taskviewprovider()),
        ChangeNotifierProvider(create: (context) =>TaskEditProvider()),
    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home:SplaceScreen(),    
        title: 'Flutter Demo',
      ),
    );
  }
}
// ssssssssssssssssssss---------prooooo






