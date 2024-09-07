import 'package:ava_milk_prod/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ava Milk Prod',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
