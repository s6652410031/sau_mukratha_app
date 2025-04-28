import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_mukratha_app/views/splash_screen_ui.dart';

void main() {
  runApp(MukrathaSauApp());
}

class MukrathaSauApp extends StatefulWidget {
  const MukrathaSauApp({super.key});

  @override
  State<MukrathaSauApp> createState() => _MukrathaSauAppState();
}

class _MukrathaSauAppState extends State<MukrathaSauApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
