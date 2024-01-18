import 'package:drink_water_reminded/features/login_screen/controller/sing_google_controller.dart';
import 'package:drink_water_reminded/features/login_screen/widgets/login_but.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../drink_water_screen/widgets/custom_toast.dart';
import '../widgets/body_login.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  @override
  void initState() {
    SingInGoogleController().checkCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<SingInGoogleController>();
    final theme = Theme.of(context);
    var showToast = FlutterToastView();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).remindDrinksWater,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              BodyLogin(
                theme: theme,
              ),
              GoogleLoginBut(
                  controller: controller,
                  theme: theme,
                  flutterToastView: showToast)
            ],
          ),
        ),
      ),
    );
  }
}
