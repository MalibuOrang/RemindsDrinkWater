import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../consts/firebase_const.dart';
import '../../../models/water_model/water_day_model.dart';

class CupsController extends GetxController {
  var cupsMl = ''.obs;
  RxInt selectedIndex = RxInt(-1);
  Future<void> storeCupsData() async {
    CollectionReference userDoc = firestore.collection(userCollection);
    CollectionReference cupsCollection =
        userDoc.doc(currentUser!.uid).collection('drinks');
    await cupsCollection.add(WaterDaysModel(
      amount: double.parse(cupsMl.value),
      userId: currentUser!.uid,
      timestamp: DateTime.now(),
    ).toJson());

    DocumentReference chartsDocRef =
        firestore.collection(chartsCollection).doc(currentUser!.uid);
    await chartsDocRef.collection(chartsDataCollection).add(WaterDaysModel(
          amount: double.parse(cupsMl.value),
          userId: currentUser!.uid,
          timestamp: DateTime.now(),
        ).toJson());
  }
}
