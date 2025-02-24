import 'package:flutter/material.dart';
import 'package:task_design1/edit_task.dart';
import 'today_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Design1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EditTaskPage(),
    );
  }
}
