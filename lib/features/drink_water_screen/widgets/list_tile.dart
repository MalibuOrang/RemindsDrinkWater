import 'package:drink_water_reminded/consts/icon_const.dart';
import 'package:drink_water_reminded/features/drink_water_screen/controller/wether_level_controller.dart';
import 'package:drink_water_reminded/models/water_model/water_day_model.dart';
import 'package:flutter/material.dart';

class WaterListTile extends StatefulWidget {
  const WaterListTile(
      {super.key, required this.snapshot, required this.controller});
  final WaterDaysModel snapshot;
  final WeatherLevelController controller;

  @override
  State<WaterListTile> createState() => _WaterListTileState();
}

class _WaterListTileState extends State<WaterListTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.asset(signInIcon),
      title: Text(
        "${widget.snapshot.amount} ml",
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        widget.controller
            .formatDate(date: widget.snapshot.timestamp, typeDate: 'HH:mm'),
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
