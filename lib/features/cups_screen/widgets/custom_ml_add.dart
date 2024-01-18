import 'package:drink_water_reminded/features/drink_water_screen/widgets/custom_toast.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../controller/cups_controller.dart';

showInputDialog(BuildContext context) {
  TextEditingController textFieldController = TextEditingController();
  var controller = Get.put(CupsController());
  var showToast = FlutterToastView();
  final theme = Theme.of(context);
  return showDialog(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(S.of(context).inputCustomWater,
            style: theme.textTheme.bodyMedium),
        content: TextField(
          style: theme.textTheme.bodyMedium,
          controller: textFieldController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
              hintText: S.of(context).hintCustomAmount,
              hintStyle: theme.textTheme.labelSmall),
        ),
        actions: <Widget>[
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme.cardColor,
                  fixedSize: const Size(200, 50)),
              child:
                  Text(S.of(context).submit, style: theme.textTheme.bodyMedium),
              onPressed: () async {
                controller.cupsMl.value = textFieldController.text;
                if (textFieldController.text.isNotEmpty &&
                    double.tryParse(textFieldController.text) != null) {
                  Navigator.of(context).pop();
                  var cupsWater = controller.cupsMl.value;
                  showToast.customToastWidget(
                      message: S.of(context).youDinkedValueml(cupsWater));
                  await controller.storeCupsData();
                } else {
                  showToast.customToastWidget(
                      message:
                          S.of(context).pleaseEnterAValidNumberForWaterAmount,
                      backgroundColor: theme.colorScheme.error,
                      gravity: ToastGravity.TOP);
                }
              },
            ),
          ),
        ],
      );
    },
  );
}
