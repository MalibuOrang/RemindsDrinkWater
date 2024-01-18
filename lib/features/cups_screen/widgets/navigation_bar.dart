import 'package:drink_water_reminded/consts/firebase_const.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/custom_toast.dart';
import 'package:drink_water_reminded/features/login_screen/controller/sing_google_controller.dart';
import 'package:drink_water_reminded/features/login_screen/view/login_screen.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPannelList extends StatelessWidget {
  const NavigationPannelList({super.key, required this.showToast});
  final FlutterToastView showToast;
  @override
  Widget build(BuildContext context) {
    var authController = Get.put(SingInGoogleController());
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Image.network('${currentUser!.photoURL}'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${currentUser!.email}',
                      style: TextStyle(
                          fontSize: 20,
                          color: theme.appBarTheme.titleTextStyle!.color),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: theme.iconTheme.color,
            ),
            title: Text(
              S.of(context).logoutFromAccount,
              style: TextStyle(color: theme.appBarTheme.titleTextStyle!.color),
            ),
            onTap: () async {
              try {
                showToast.customToastWidget(
                    message: S.of(context).logoutFromTheApp);
                await authController.signOut();
                Get.off(() => const LoginWithGoogle());
              } catch (e) {
                showToast.customToastWidget(message: '$e');
              }
            },
          )
        ],
      ),
    );
  }
}
