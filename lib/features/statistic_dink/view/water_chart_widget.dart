import 'package:drink_water_reminded/consts/firebase_const.dart';
import 'package:drink_water_reminded/features/drink_water_screen/controller/wether_level_controller.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/loading_indicator.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:drink_water_reminded/models/water_model/water_day_model.dart';
import 'package:drink_water_reminded/features/statistic_dink/widgets/water_chart/diagram_data.dart';
import 'package:drink_water_reminded/features/statistic_dink/widgets/water_chart/widgets/get_bottom_tiles.dart';
import 'package:drink_water_reminded/features/statistic_dink/widgets/water_chart/widgets/get_top_tiles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WaterChartWeek extends StatelessWidget {
  const WaterChartWeek({super.key, required this.controller});
  final WeatherLevelController controller;
  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = controller.generateWeekDays(context);
    return StreamBuilder(
      stream: controller.getChartsInfo(currentUser!.uid),
      builder: (context, AsyncSnapshot<List<WaterDaysModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator(color: Colors.lightBlue);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<WaterDaysModel> dataDrink = snapshot.data!;
          controller.writeDataAllWater(dataDrink, daysOfWeek);
          DiagramData waterDiagramData = DiagramData(
            monAmount: controller.allWater[0],
            tueAmount: controller.allWater[1],
            wedAmount: controller.allWater[2],
            thurAmount: controller.allWater[3],
            friAmount: controller.allWater[4],
            satAmount: controller.allWater[5],
            sunAmount: controller.allWater[6],
          );
          waterDiagramData.initializeWaterData();
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: BarChart(
                    BarChartData(
                      maxY: 2500,
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: const FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true, getTitlesWidget: getTopTitle),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: getBottomTitle),
                        ),
                      ),
                      barGroups: waterDiagramData.diagramData
                          .map(
                            (data) => BarChartGroupData(
                              x: data.x,
                              barRods: [
                                BarChartRodData(
                                  toY: data.y,
                                  color: Colors.blue[300],
                                  width: 25,
                                  borderRadius: BorderRadius.circular(4),
                                  backDrawRodData: BackgroundBarChartRodData(
                                      show: true,
                                      toY: 2500,
                                      color: Colors.grey[200]),
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).averageWaterDrunks,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${controller.getAvgFromList()} ml',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
