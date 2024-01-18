import 'package:drink_water_reminded/consts/firebase_const.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/list_tile.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/loading_indicator.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/stream_statistic.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:drink_water_reminded/models/water_model/water_day_model.dart';
import 'package:flutter/material.dart';
import '../controller/wether_level_controller.dart';

class StreamListWater extends StatelessWidget {
  const StreamListWater({super.key, required this.controller});
  final WeatherLevelController controller;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder(
      stream: controller.getCupsInfo(userCollection, currentUser!.uid),
      builder: (context, AsyncSnapshot<List<WaterDaysModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator(color: theme.colorScheme.background);
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: TextStyle(
              color: theme.colorScheme.error,
            ),
          );
        } else {
          List<WaterDaysModel>? dataDrink = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: dataDrink!.length,
                    separatorBuilder: (context, index) => Divider(
                      color: theme.dividerColor,
                    ),
                    itemBuilder: (context, index) => WaterListTile(
                      snapshot: dataDrink[index],
                      controller: controller,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(S.of(context).hidrationStatistic),
                ),
                StreamStatistic(
                  controller: WeatherLevelController(),
                  snapshot: dataDrink,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
