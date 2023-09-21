import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouttraker/helpers/appcolors..dart';
import 'package:workouttraker/utility/chartfunction.dart';

import '../../controller/chartcontroller.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChartData>(
      create: (context) => ChartData(),
      child: Consumer<ChartData>(
        builder: (context, chartData, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Chart'),
              backgroundColor: colors.primarytheme,
            ),
            body: Card(
              color: colors.whitetheme,
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: chartData.selectedValue == 'Day'
                              ? chartData.daytotal != 0
                              : chartData.selectedValue == 'Week'
                                  ? chartData.weektotal != 0
                                  : chartData.selectedValue == 'Month'
                                      ? chartData.monthtotal != 0
                                      : false,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.list_alt_outlined,
                                        size: 25,
                                        color: colors.primarytheme),
                                    Text(
                                        'Totaltask ${chartData.selectedValue == 'Day' ? chartData.daytotal : chartData.selectedValue == 'Week' ? chartData.weektotal : chartData.selectedValue == 'Month' ? chartData.monthtotal : 0}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.task_alt_outlined,
                                        color: Colors.green),
                                    Text(
                                        'Completed ${chartData.selectedValue == 'Day' ? chartData.dayCompleted : chartData.selectedValue == 'Week' ? chartData.weekcompleted : chartData.selectedValue == 'Month' ? chartData.monthcompleted : 0}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.clear_outlined,
                                        color: Colors.red),
                                    Text(
                                        'Incompleted ${chartData.selectedValue == 'Day' ? chartData.daydiffrence : chartData.selectedValue == 'Week' ? chartData.weekdiffrence : chartData.selectedValue == 'Month' ? chartData.monthdiffrence : 0}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          elevation: 10,
                          underline: Container(
                            height: 2,
                            color:  colors.whitetheme,
                          ),
                          dropdownColor:  colors.whitetheme,
                          focusColor:  colors.whitetheme,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsetsDirectional.all(3),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: colors.primarytheme),
                          borderRadius: BorderRadius.circular(15),
                          value: chartData.selectedValue,
                          style: const TextStyle(
                              color: colors.whitetheme),
                          items: <String>['Day', 'Week', 'Month']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontFamily: AutofillHints.username),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              chartData.selectedValue = newValue;
                            }
                          },
                        ),
                      ],
                    ),
                    AspectRatio(
                      aspectRatio: 1.8,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback: (FlTouchEvent event, pieTouchResponse) {
                              // No need to use setState here as it's within a Consumer
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                chartData.touchedIndex = -1;
                                return;
                              }
                              chartData.touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 0,
                          sections: chartData.showingSections(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}