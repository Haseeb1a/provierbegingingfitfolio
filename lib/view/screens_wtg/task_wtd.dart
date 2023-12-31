import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:workouttraker/controller/taskviewcontroller.dart';
import 'package:workouttraker/function/db_functions.dart';
import 'package:workouttraker/helpers/appcolors..dart';
import 'package:workouttraker/model/task_model/workoutmodel1.dart';
import 'package:intl/intl.dart';
import 'package:workouttraker/view/sub_screens_wtd/other_sub/edit.dart';
import 'package:workouttraker/utility/utilitycolor.dart';
import 'package:lottie/lottie.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  // final TextEditingController _searchController = TextEditingController();
  @override
  // void initState() {
  //   super.initState();
  //   _searchController.addListener(_onSearchChanged);
  // }

//   void _onSearchChanged() {
//   setState(() {
//     if (_searchController.text.isEmpty) {
//       isSearching = false;
//       filteredTasks.clear();
    
//     } else {
//       isSearching = true;
//       filteredTasks = workoutListNotifier.value
     
//           .where((task) =>
//               task.typename
//                   .toLowerCase()
//                   .contains(_searchController.text.toLowerCase()))
//           .toList();
//     }
//   });
// }
  @override
  Widget build(BuildContext context) {
     final searchProvider = Provider.of<Taskviewprovider>(context);
   workoutListNotifier.notifyListeners();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(225, 27, 57, 61),
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.only( left: 10, right: 10),
          child: TextField(
            controller: searchProvider.searchController,
            decoration: InputDecoration(
              hintText: 'Search....',
              prefixIcon: const Icon(Icons.search),
              suffixIcon:  IconButton(
            onPressed: () {
              
             searchProvider.searchController.clear();
            },
            icon: const Icon(Icons.clear),
          ),
              filled: true,
              fillColor: colors.whitetheme,
              // contentPadding:
              //     const EdgeInsets.only(left: 14.0, bottom: 8, top: 8),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 20, 19, 19)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: workoutListNotifier,
              builder:
                  (BuildContext ctx, List<Workoutmodel> workoutlist, Widget? child) {
                    
                 List<Workoutmodel> tasksToDisplay = searchProvider.isSearching
        ? searchProvider.filteredTasks
        : workoutListNotifier.value;

                if (workoutlist.isEmpty) {
                  return Center(
                    child: SizedBox(
                      height: 245,
                      width: 245,
                      child: Lottie.asset('assets/images/data.json',fit: BoxFit.cover)
                      
                      ),
                  );
                } else {
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = tasksToDisplay[index];
                      return Slidable(
                        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: const Color.fromARGB(255, 27, 57, 61),
                                    content: const Text(
                                      "Are you sure you want to delete the Task",
                                      style: TextStyle(color:colors.whitetheme),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(color:colors.whitetheme),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          "OK",
                                          style: TextStyle(color:colors.whitetheme),
                                        ),
                                          onPressed: () {
                                          Navigator.of(context).pop(true);
                                          deleteTask(index);
                                          _showSnackbardelete(context, data.typename);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icons.delete_forever_rounded,
                            backgroundColor: Colors.red,
                            foregroundColor: colors.whitetheme,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateScreen(
                                    typename: data.typename,
                                    weight: data.weight,
                                    sets: data.reps,
                                    reps: data.sets,
                                    isChecked: false,
                                    date: data.date,
                                    duration: data.duration,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            icon: Icons.edit,
                            backgroundColor:colors.secondarytheme,
                            foregroundColor: colors.darktheme,
                          ),
                        ]),
                        child: SizedBox(
                          height: 220,
                          width: double.infinity,
                          child: Card(
                            elevation: 20,
                            child: Container(
                              height: 200,
                              width: 450,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: getBackgroundColor(
                                  data.isChecked,
                                  data.duration,
                                  data.date,
                                ),
                                border: Border.all(
                                  color: colors.whitetheme,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35, top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.typename,
                                          style: TextStyle(fontSize: screenWidth * 0.06),
                                        ),
                                     Checkbox(
  value: data.isChecked,
  onChanged: (bool? newValue) {
    searchProvider.updateTaskCompletion(index, newValue ?? true);

    updateTask(index, data);

 if (data.isChecked) {
                                              Future.delayed(const Duration(milliseconds: 180), () {
                                                _showSnackbar(context, ' ${data.typename}');
                                              });
                                            }
  },
),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 0, top: 10),
                                      ),
                                      Container(
                                        width: screenHeight * 0.1,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: colors.whitetheme,
                                          border: Border.all(
                                            color: colors.whitetheme,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${data.weight} KG ',
                                            style: const TextStyle(fontSize: 19),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screenHeight * 0.14,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: colors.whitetheme,
                                          border: Border.all(
                                            color: colors.whitetheme,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${data.sets} REPS",
                                            style: const TextStyle(fontSize: 19),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screenHeight * 0.14,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: colors.whitetheme,
                                          border: Border.all(
                                            color: colors.whitetheme,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            " ${data.reps} SETS",
                                            style: const TextStyle(fontSize: 19),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35, top: 35),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('yyyy-MM-dd').format(data.date),
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        Text(data.duration),
                                      ],
                                    ),
                                  ),
                                  //  Text('Number of Day Tasks: $dayTasksCount'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (cxt, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: tasksToDisplay.length,
                  );
                }
              },          
            ),            
          ),
        ],
      ),
    );
  }

    void _showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: colors.whitetheme,
          content: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.green),
              Text(
                ' $message task is completed.!',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          duration: const Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }

    void _showSnackbardelete(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          content: Row(
            children: [
              const Icon(Icons.delete_forever_rounded, color: Colors.red),
              Text(
                ' $message task is deleted',
                style: const TextStyle(color: colors.whitetheme),
              ),
            ],
          ),
          duration: const Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
    }
}
