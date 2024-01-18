import 'package:drink_water_reminded/features/drink_water_screen/controller/wether_level_controller.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:drink_water_reminded/features/statistic_dink/view/water_chart_widget.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).chartsOfWeek,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: Column(
        children: [
          WaterChartWeek(
            controller: WeatherLevelController(),
          )
        ],
      ),
    );
  }
}
