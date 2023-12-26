import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdk_implement_testing/screens/add_todo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddTodo(),
    );
  }
}