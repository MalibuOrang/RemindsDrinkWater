import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drink_water_reminded/features/drink_water_screen/widgets/custom_toast.dart';
import 'package:drink_water_reminded/features/login_screen/view/login_screen.dart';
import 'package:drink_water_reminded/features/home_screen/view/home.dart';
import 'package:drink_water_reminded/generated/l10n.dart';
import 'package:drink_water_reminded/models/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../consts/firebase_const.dart';

class SingInGoogleController extends GetxController {
  Future<UserCredential?> loginMethod({context}) async {
    AuthCredential? userCredential;
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      userCredential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
    } on FirebaseAuthException catch (e) {
      printError(info: e.toString());
    }
    try {
      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(userCredential!);
      return result;
    } catch (e) {
      printError(info: e.toString());
      return null;
    }
  }

  Future<void> createStoreUserData({required collection}) async {
    DocumentReference store =
        firestore.collection(collection).doc(currentUser!.uid);
    store.set(UsersModel(
            lastLogin: DateTime.now(),
            userId: currentUser!.uid,
            waterPerDay: 2500)
        .toJson());
  }

  Future<void> updateUserData({required collection}) async {
    DocumentReference store =
        firestore.collection(collection).doc(currentUser!.uid);
    store.update(UsersModel(
            lastLogin: DateTime.now(),
            userId: currentUser!.uid,
            waterPerDay: 2500)
        .toJson());
  }

  checkCurrentUser() async {
    try {
      StreamSubscription<User?>? authSubscription;
      authSubscription = auth.authStateChanges().listen((User? user) async {
        if (user == null) {
          Get.to(() => const LoginWithGoogle());
          authSubscription?.cancel();
        } else {
          Get.offAll(() => const WaterHomeScreen());
          await updateUserData(collection: userCollection);
          authSubscription?.cancel();
        }
      });
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> onPressLoginBut(
      BuildContext context, var theme, FlutterToastView toast) async {
    await loginMethod().then((result) {
      if (result != null) {
        createStoreUserData(collection: userCollection);
        toast.customToastWidget(message: S.of(context).loginSuccessful);
        Get.to(() => const WaterHomeScreen());
      } else {
        toast.customToastWidget(
            message: S.of(context).loginFailed,
            backgroundColor: theme.colorScheme.error);
      }
    });
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      printError(info: e.toString());
    }
  }
}
