import 'dart:math';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drink_water_reminded/consts/const_text.dart';
import 'package:drink_water_reminded/consts/firebase_const.dart';
import 'package:drink_water_reminded/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class SheduleTaskService {
  int generateRandomId(int interval) {
    Random random = Random();
    int genId = random.nextInt(interval);
    return genId;
  }

  Future<void> notificationTask(
    String? title,
  ) async {
    await NotificationServices().showNotification(
      id: generateRandomId(10),
      title: notyTitleRu,
      body: title,
    );
  }

  Future<void> clearWaterCollection() async {
    try {
      await Firebase.initializeApp();
      DocumentReference userDocRef =
          firestore.collection(userCollection).doc(currentUser!.uid);
      QuerySnapshot subcollectionSnapshot =
          await userDocRef.collection(cupsCollection).get();
      for (QueryDocumentSnapshot docSnapshot in subcollectionSnapshot.docs) {
        await userDocRef
            .collection(cupsCollection)
            .doc(docSnapshot.id)
            .delete();
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Future<void> clearChartsCollection() async {
    try {
      await Firebase.initializeApp();
      DocumentReference chartsDoc = firestore.doc(currentUser!.uid);
      QuerySnapshot collectionSnapshot =
          await chartsDoc.collection(chartsCollection).get();
      for (QueryDocumentSnapshot docSnapshot in collectionSnapshot.docs) {
        await chartsDoc
            .collection(chartsCollection)
            .doc(docSnapshot.id)
            .delete();
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  startPeriodicTask(Future<void> callback, Duration interval) {
    AndroidAlarmManager.periodic(
      interval,
      generateRandomId(100),
      (_) async {
        await callback;
      },
      exact: true,
      wakeup: true,
    );
  }
}
