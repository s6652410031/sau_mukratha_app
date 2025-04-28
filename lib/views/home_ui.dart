import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sau_mukratha_app/views/about_ui.dart';
import 'package:sau_mukratha_app/views/cal_bill_ui.dart';
import 'package:sau_mukratha_app/views/menu_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final NotchBottomBarController _pageController =
      NotchBottomBarController(index: 1);

  List<Widget> viewInBody = [
    CalBillUI(),
    MenuUI(),
    AboutUI(),
  ];

  int indexShow = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "หมูกะทะตาต้อย",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valueParam) {
          setState(
            () {
              indexShow = valueParam;
            },
          );
        },
        kIconSize: 20,
        kBottomRadius: 20,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        notchBottomBarController: _pageController,
        bottomBarItems: [
          //? Bottom bar bill
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.grey[400],
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน',
          ),
          //? Bottom bar home
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              color: Colors.grey[400],
            ),
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
            itemLabel: 'MENU',
          ),
          //? Bottom bar about
          BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Colors.grey[400],
            ),
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemLabel: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: viewInBody[indexShow],
    );
  }
}
