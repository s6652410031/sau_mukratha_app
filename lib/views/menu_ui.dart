import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUI extends StatefulWidget {
  const MenuUI({super.key});

  @override
  State<MenuUI> createState() => _MenuUIState();
}

class _MenuUIState extends State<MenuUI> {
  //? ตัวแปรเก็บรูปเมนู
  List<String> menuShow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];
  //? ตัวแปรเก็บรูปร้านสาขา
  List<String> branchShow = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];
  //? ตัวแปร latitude/longitude (GPS)
  List<String> shopLocation = [
    "https://www.google.com/maps/@13.7325645,100.3665034,3018m",
    "https://www.google.com/maps/@13.7323461,100.3667342,3018m",
    "https://www.google.com/maps/@41.2055515,123.1909801,3018m",
    "https://www.google.com/maps/@44.6046937,-110.5567039,3018m",
    "https://www.google.com/maps/@35.3606409,138.7078795,3018m",
  ];

  //? เมธอดเปิด Browser
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24),
            //? Image logo
            Image.asset(
              'assets/images/logo.png',
              width: 180,
            ),
            SizedBox(height: 24),
            //? Text เมนูเด็ด
            Text(
              "เมนูเด็ด",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            //? Listview เมนูเด็ด
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuShow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        menuShow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            //? Text เมนูเด็ด
            Text(
              "ร้านในเครือ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: branchShow.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 15,
                    ),
                    child: InkWell(
                      onTap: () {
                        _launchInBrowser(
                          Uri.parse(shopLocation[index]),
                        );
                      },
                      child: Image.asset(
                        branchShow[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
