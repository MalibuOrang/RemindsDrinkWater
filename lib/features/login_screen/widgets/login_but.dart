import 'package:drink_water_reminded/consts/icon_const.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/custom_toast.dart';
import 'package:drink_water_reminded/features/login_screen/controller/sing_google_controller.dart';
import 'package:flutter/material.dart';

class GoogleLoginBut extends StatelessWidget {
  const GoogleLoginBut(
      {super.key,
      required this.controller,
      required this.theme,
      required this.flutterToastView});
  final SingInGoogleController controller;
  final ThemeData theme;
  final FlutterToastView flutterToastView;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200]),
          child: IconButton(
            onPressed: () async {
              controller.onPressLoginBut(context, theme, flutterToastView);
            },
            icon: Image.asset(
              googleSing,
              height: 80,
              width: 80,
            ),
          ),
        ));
  }
}
