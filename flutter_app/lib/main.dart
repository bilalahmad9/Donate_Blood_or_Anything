import 'package:flutter/material.dart';
import 'splash.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'DonateSelect.dart';
import 'DonateOtherPage.dart';
import 'DonateBloodPage.dart';
import 'DonorsPage.dart';
import 'OtherDonorPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}


