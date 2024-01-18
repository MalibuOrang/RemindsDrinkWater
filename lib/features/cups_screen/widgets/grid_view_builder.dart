import 'package:drink_water_reminded/consts/const_text.dart';
import 'package:drink_water_reminded/consts/icons_list_const.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cups_controller.dart';

class GridViewBuilderWidget extends StatelessWidget {
  final CupsController controller;

  const GridViewBuilderWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.builder(
      shrinkWrap: true,
      itemCount: addWaterGrid.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 120,
      ),
      itemBuilder: (context, index) {
        var addGridName = gridNameCups;
        addGridName.add(S.of(context).custom);
        return Obx(
          () => GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: controller.selectedIndex.value == index
                    ? Border.all(
                        color: theme.colorScheme.background, width: 1.0)
                    : null,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Image.asset(
                    addWaterGrid[index],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${addGridName[index]} ${S.of(context).MlWater}',
                    style: TextStyle(
                      color: controller.selectedIndex.value == index
                          ? theme.colorScheme.background
                          : theme.appBarTheme.titleTextStyle!.color,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              controller.selectedIndex.value = index;
              controller.cupsMl.value = addGridName[index].toString();
            },
          ),
        );
      },
    );
  }
}
