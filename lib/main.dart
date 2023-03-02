import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_second/screens/function_screen.dart';
import 'package:to_do_app_second/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData()..loadTasksFromPrefs(),
      child: MaterialApp(
        title: 'To Do App',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const SplashScreen(),
      ),
    );
  }
}
