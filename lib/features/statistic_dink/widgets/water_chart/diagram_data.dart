import 'package:drink_water_reminded/features/statistic_dink/widgets/water_chart/week_diagram_water.dart';

class DiagramData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  DiagramData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });
  List<WeekDiagramDrinkWater> diagramData = [];
  void initializeWaterData() {
    diagramData = [
      WeekDiagramDrinkWater(x: 0, y: sunAmount),
      WeekDiagramDrinkWater(x: 1, y: monAmount),
      WeekDiagramDrinkWater(x: 2, y: tueAmount),
      WeekDiagramDrinkWater(x: 3, y: wedAmount),
      WeekDiagramDrinkWater(x: 4, y: thurAmount),
      WeekDiagramDrinkWater(x: 5, y: friAmount),
      WeekDiagramDrinkWater(x: 6, y: satAmount),
    ];
  }
}
