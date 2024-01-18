import 'package:drink_water_reminded/features/drink_water_screen/controller/wether_level_controller.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/stream_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../generated/l10n.dart';

class DrinkWaterScreen extends StatelessWidget {
  const DrinkWaterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = GetIt.I.get<WeatherLevelController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).cupsOfThisDay,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: StreamListWater(controller: controller),
    );
  }
}
