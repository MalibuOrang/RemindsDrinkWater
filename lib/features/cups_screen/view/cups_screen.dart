import 'package:drink_water_reminded/features/cups_screen/controller/cups_controller.dart';
import 'package:drink_water_reminded/features/cups_screen/widgets/custom_ml_add.dart';
import 'package:drink_water_reminded/features/cups_screen/widgets/grid_view_builder.dart';
import 'package:drink_water_reminded/features/cups_screen/widgets/navigation_bar.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../drink_water_screen/widgets/custom_toast.dart';

class CupsAddScreen extends StatefulWidget {
  const CupsAddScreen({super.key});

  @override
  State<CupsAddScreen> createState() => _CupsAddScreenState();
}

class _CupsAddScreenState extends State<CupsAddScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<CupsController>();
    var showToast = FlutterToastView();
    final theme = Theme.of(context);
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: Drawer(
          child: NavigationPannelList(showToast: showToast),
        ),
        appBar: AppBar(
          title: Text(
            S.of(context).addCupsOfWater,
            style: theme.textTheme.bodyMedium,
          ),
          iconTheme: theme.iconTheme,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: GridViewBuilderWidget(controller: controller),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.background,
                    fixedSize: const Size(200, 50)),
                onPressed: () async {
                  if (controller.cupsMl.value == S.of(context).custom) {
                    showInputDialog(context);
                  } else if (controller.cupsMl.value != S.of(context).custom) {
                    var cupsWater = controller.cupsMl.value;
                    showToast.customToastWidget(
                        message: S.of(context).youDinkedValueml(cupsWater));
                    await controller.storeCupsData();
                  } else {
                    showToast.customToastWidget(
                        message: S.of(context).youGetSomeErrors,
                        backgroundColor: theme.colorScheme.error);
                  }
                },
                child: Text(
                  S.of(context).drinkWater,
                  style: TextStyle(
                      color: theme.textTheme.bodyMedium!.color,
                      fontWeight: theme.textTheme.bodyMedium!.fontWeight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
