import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:workouttraker/utility/chartfunction.dart'; // Import your data functions

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:workouttraker/utility/chartfunction.dart'; // Import your data functions

class ChartData extends ChangeNotifier {
  String _selectedValue = 'Day'; // Initial selected value
  int daytotal = getDayTasksCount();
  int dayCompleted = getDayTasksCountCpt();
  int weektotal = getWeekTasksCountwk();
  int weekcompleted = getWeekTasksCountCheckeds();
  int monthtotal = getMonthTasksCount();
  int monthcompleted = getMonthTasksCountmonth();
  int daydiffrence = getDayTasksCount() - getDayTasksCountCpt();
  int weekdiffrence = getWeekTasksCountwk() - getWeekTasksCountCheckeds();
  int monthdiffrence = getMonthTasksCount() - getMonthTasksCountmonth();
  int touchedIndex = -1;
  
  // Getter for selected value
  String get selectedValue => _selectedValue;

  // Setter for selected value
  set selectedValue(String newValue) {
    _selectedValue = newValue;
    notifyListeners(); // Notify listeners when the value changes
  }

  // Add methods to update other data properties based on selectedValue
  List<PieChartSectionData> showingSections() {
    switch (_selectedValue) {
      case 'Day':
        int completedTasks = dayCompleted;
        int totalTasks = daytotal;
        double completedPercentage = (completedTasks / totalTasks) * 100;
        double remainingPercentage = 100 - completedPercentage;
        return generateChartData(completedPercentage, remainingPercentage);
      case 'Week':
        int completedTasks = weekcompleted;
        int totalTasks = weektotal;
        double completedPercentage = (completedTasks / totalTasks) * 100;
        double remainingPercentage = 100 - completedPercentage;
        return generateChartData(completedPercentage, remainingPercentage);
      case 'Month':
        int completedTasks = monthcompleted;
        int totalTasks = monthtotal;
        double completedPercentage = (completedTasks / totalTasks) * 100;
        double remainingPercentage = 100 - completedPercentage;
        return generateChartData(completedPercentage, remainingPercentage);
      default:
        throw Exception('Invalid selected value');
    }
  }

  List<PieChartSectionData> generateChartData(double value1, double value2) {
    final List<Color> colors = [Colors.green, Colors.red];
    final List<double> values = [value1, value2];

    if (values.any((value) => value.isNaN || value.isInfinite || value.isNegative)) {
      return [
        PieChartSectionData(
          color: Colors.grey,
          value: 100.0,
          title: 'NO TASKS',
          radius: 100.0,
          titleStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
          ),
          titlePositionPercentageOffset: 0.0,
        ),
      ];
    }

    return List.generate(2, (i) {
      final fontSize = 16.0;
      final radius = 100.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: colors[i],
        value: values[i],
        title: 'Task ${values[i].toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
      );
    });
  }
}