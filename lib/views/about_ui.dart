import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  //? เมธอดโทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //? Image logo sau
            Image.asset(
              "assets/images/saulogo.png",
              width: 150,
            ),
            SizedBox(height: 35),
            //? Text หมูกะทะตาต้อย
            Text(
              "หมูกะทะตาต้อย",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35),
            //? Text แอปพลิเคชัน...
            Text(
              "แอปพลิเคชันร้านหมูกะทะ\nเพื่อคนไทย\nโดยเด็กไทย\nสนใจแอปพลิเคชันติดต่อ",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            //? Text เด็กไอที SAU
            Text(
              "เด็กไอที SAU",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 25),
            //? Image sauqr
            InkWell(
              onTap: () {
                _makePhoneCall('0617878797');
              },
              child: Image.asset(
                "assets/images/sauqr.png",
                height: 85,
              ),
            )
          ],
        ),
      ),
    );
  }
}
