import 'package:expense_tracker/homepage.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
       title: "Expense Tracker",
      home: Expenses(),
    );
  }
}