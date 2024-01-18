import 'package:drink_water_reminded/models/water_model/water_day_model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:drink_water_reminded/consts/firebase_const.dart';
import 'package:get/get.dart';

import '../../../models/user_model/user_model.dart';

class WeatherLevelController extends GetxController {
  var maxNumberOfWater = 0.0.obs;
  var totalPercent = 0.0.obs;
  List<double> allWater = [0.0].obs;

  int getAvgFromList() {
    allWater
        .reduce((value, element) => maxNumberOfWater.value = value + element);
    double avg = maxNumberOfWater.value.round() / allWater.length;
    return avg.round();
  }

  Stream<List<UsersModel>> getUserInfo(clientCollection, uid) {
    return firestore
        .collection(clientCollection)
        .where('user_id', isEqualTo: uid)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((document) => UsersModel.fromJson(document.data()))
            .toList());
  }

  Stream<List<WaterDaysModel>> getCupsInfo(String userCollection, String uid) {
    var data = firestore
        .collection(userCollection)
        .doc(uid)
        .collection(cupsCollection)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((document) => WaterDaysModel.fromJson(document.data()))
            .toList());
    return data;
  }

  Stream<List<WaterDaysModel>> getChartsInfo(String uid) {
    var data = firestore
        .collection(chartsCollection)
        .doc(uid)
        .collection(chartsDataCollection)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((document) => WaterDaysModel.fromJson(document.data()))
            .toList());
    return data;
  }

  formatDate({required DateTime date, required String typeDate}) {
    String formattedDateTime = DateFormat(typeDate).format(date);
    return formattedDateTime;
  }

  int calculateSum(List<WaterDaysModel> data) {
    int sum = 0;
    for (var i = 0; i < data.length; i++) {
      double amount = data[i].amount;
      sum += amount.toInt();
    }
    return sum;
  }

  List<String> generateWeekDays(BuildContext context) {
    List<String> weekDays = [];
    DateTime now = DateTime.now();

    for (int i = DateTime.monday; i <= DateTime.sunday; i++) {
      DateTime day = DateTime(now.year, now.month, now.day + i - now.weekday);
      String formattedDay =
          DateFormat('EEEE', Localizations.localeOf(context).toString())
              .format(day);
      weekDays.add(formattedDay);
    }

    return weekDays;
  }

  List<double> writeDataAllWater(
      List<WaterDaysModel> data, List<String> daysOfWeek) {
    allWater = [];
    for (String day in daysOfWeek) {
      double totalAmount = 0.0;
      for (var i = 0; i < data.length; i++) {
        if (formatDate(date: data[i].timestamp, typeDate: 'EEEE') == day) {
          totalAmount += double.parse(data[i].amount.toString());
        }
      }
      allWater.add(totalAmount);
    }
    return allWater;
  }

  double calculatePercent(int waterPerDay, data) {
    totalPercent.value = (calculateSum(data) / waterPerDay) * 100;
    if (totalPercent.value > 100) {
      return totalPercent.value = 100;
    } else {
      return totalPercent.value;
    }
  }
}
