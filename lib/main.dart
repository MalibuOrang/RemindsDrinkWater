import 'package:drink_water_reminded/consts/const_text.dart';
import 'package:drink_water_reminded/drink_water_reminder.dart';
import 'package:drink_water_reminded/services/lazy_init_controller.dart';
import 'package:drink_water_reminded/services/notification_services.dart';
import 'package:drink_water_reminded/services/shedule_tasks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationServices().initNotification();
  await AndroidAlarmManager.initialize();
  LazyInitController().initAllControllers();
  startBackgroundTask(periodicNotyTask, const Duration(hours: 1, minutes: 30));
  startBackgroundTask(clearWaterDataTask, const Duration(hours: 24));
  startBackgroundTask(clearChartsDataTask, const Duration(days: 7));
  runApp(const DrinkWaterApp());
}

void periodicNotyTask() async {
  await SheduleTaskService().notificationTask(notyTextRu);
}

void clearWaterDataTask() async {
  await SheduleTaskService().clearWaterCollection();
}

void clearChartsDataTask() async {
  await SheduleTaskService().clearChartsCollection();
}

void startBackgroundTask(Function callback, Duration interval) {
  int alarmId = SheduleTaskService().generateRandomId(100);
  AndroidAlarmManager.periodic(
    interval,
    alarmId,
    callback,
    wakeup: true,
    exact: true,
  );
}
