import 'package:drink_water_reminded/consts/firebase_const.dart';
import 'package:drink_water_reminded/features/drink_water_screen/controller/wether_level_controller.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/loading_indicator.dart';
import 'package:drink_water_reminded/models/user_model/user_model.dart';
import 'package:drink_water_reminded/models/water_model/water_day_model.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class StreamStatistic extends StatefulWidget {
  const StreamStatistic(
      {super.key, required this.controller, required this.snapshot});
  final WeatherLevelController controller;
  final List<WaterDaysModel> snapshot;

  @override
  State<StreamStatistic> createState() => _StreamStatisticState();
}

class _StreamStatisticState extends State<StreamStatistic> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder(
      stream: widget.controller.getUserInfo(userCollection, currentUser!.uid),
      builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
        if (!snapshot.hasData) {
          return loadingIndicator(color: theme.colorScheme.background);
        } else {
          List<UsersModel>? data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: widget.controller
                    .calculatePercent(data!.first.waterPerDay, widget.snapshot),
                appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(
                    handlerSize: 0,
                    trackWidth: 15,
                    progressBarWidth: 15,
                  ),
                  infoProperties: InfoProperties(
                    bottomLabelText:
                        "${widget.controller.calculateSum(widget.snapshot)}/${data.first.waterPerDay} ml",
                    bottomLabelStyle: const TextStyle(
                      letterSpacing: 0.1,
                      fontSize: 20,
                      height: 1.5,
                    ),
                    mainLabelStyle: TextStyle(
                      color: theme.colorScheme.background,
                      fontSize: 24,
                    ),
                  ),
                  animationEnabled: true,
                  size: 220,
                  customColors: CustomSliderColors(
                    trackColor: theme.dividerColor,
                    hideShadow: true,
                    progressBarColors: [
                      theme.colorScheme.background,
                      theme.cardColor
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
