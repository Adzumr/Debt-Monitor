
import 'package:debt_monitor/screens/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';  

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const ToDoScreen(),
    );
  }
}
