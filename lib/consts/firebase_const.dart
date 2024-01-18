import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
User? currentUser = auth.currentUser;
const userCollection = 'users';
const cupsCollection = 'drinks';
const chartsCollection = 'chart';
const chartsDataCollection = 'charts_data';
