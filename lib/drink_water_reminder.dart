import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:drink_water_reminded/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/login_screen/view/login_screen.dart';

class DrinkWaterApp extends StatefulWidget {
  const DrinkWaterApp({super.key});

  @override
  State<DrinkWaterApp> createState() => _DrinkWaterAppState();
}

class _DrinkWaterAppState extends State<DrinkWaterApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const LoginWithGoogle(),
    );
  }
}
