import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Text(
            "TODO App",
            style: TextStyle(
              shadows: [
                Shadow(
                  color: Colors.yellow,
                  blurRadius: 6,
                ),
              ],
              color: Colors.pink,
              fontWeight: FontWeight.w900,
              fontSize: 36,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
