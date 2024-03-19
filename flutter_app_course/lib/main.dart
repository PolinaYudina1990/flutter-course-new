import 'package:flutter/material.dart';
import 'package:flutter_app_course/task-10/task-10.dart';
import 'package:flutter_app_course/task-8/task_8.dart';
import 'package:flutter_app_course/task-9/task_9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyProfile(),
      // const GestureContainer(title: 'Gesture Container')
      //const NewIncrement(title: 'Flutter Demo Home Page'),
    );
  }
}
