import 'package:ava_milk_prod/pages/home_page.dart';
import 'package:ava_milk_prod/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env["APIKEY"]!,
      authDomain: dotenv.env["AUTHDOMAIN"]!,
      projectId: dotenv.env["PROJECTID"]!,
      storageBucket: dotenv.env["STORAGEBUCKET"]!,
      messagingSenderId: dotenv.env["MESSAGINGSENDERID"]!,
      appId: dotenv.env["APPID"]!,
      measurementId: dotenv.env["MEASUREMENTID"]!,
    ),
  );

  Constants.db.initialiseDB();
  Constants.db.test();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ava Milk Prod',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
