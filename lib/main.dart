import 'package:flutter/material.dart';
import 'package:hamon_student_pro/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClassRoom Manager',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      routes: routes,
      initialRoute: Routes.homeScreen,
    );
  }
}
