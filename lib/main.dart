import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/homepage.dart';

void main() async {
  await Hive.initFlutter();
  // await Hive.box("_myBox");
  var box = await Hive.openBox('_mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
