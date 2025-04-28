import 'package:flutter/material.dart';
import 'package:sau_mukratha_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  //? Delay 3 seconds and navigate to HomeUI
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //? Image logo
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/logo.png',
                width: mediaQueryWidth * 0.65,
              ),
            ),
            SizedBox(height: 40),
            //? Loading circular indicator
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 40),
            //? Text Tech SAU BUFFET
            Text(
              "Tech SAU BUFFET",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            //? Text copyright
            Text(
              "Copyright © 2025 by chanachai",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
