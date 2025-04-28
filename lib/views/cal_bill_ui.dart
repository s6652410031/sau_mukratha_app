import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  //? ตัวแปรสำหรับ ผู้ใหญ่และเด็ก
  bool adultCheck = false;
  bool childCheck = false;

  //? ตัวควบคุม TextField
  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController childCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController pureCtrl = TextEditingController(text: '0');

  //? ตัวแปร radio
  int waterCheck = 1;

  //? ตัวแปรเก็บรูปที่ถ่าย
  File? imgFile;

  //? ตัวแปรเก็บประเภทสมาชิก
  List<String> memberType = [
    'ไม่เป้นสมาชิก',
    'สมาชิกทั่วไปลด 5%',
    'สมาชิก VIP 20%',
  ];

  //? ตัวแปรเก็บส่วดลดจากประภทสมาชิก
  double discount = 0;
  double showDiscount = 0.0;
  //? เมธอดเปิดกล้อง
  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      //? เลือกรูปจากแกลเลอรี่ source: ImageSource.gallery,
      source: ImageSource.camera,
      imageQuality: 75,
    );
    //? เช็คว่าได้ถ่ายรูป
    if (picker == null) return;

    //? ถ้าถ่ายรูปให้ไปกำหนดตัวแปร imgFile
    setState(
      () {
        imgFile = File(picker.path);
      },
    );
  }

  //? เมธอด dialog
  Future<void> showValidationDialog(
      BuildContext context, String message) async {
    await showOkAlertDialog(
      context: context,
      title: "แจ้งเตือน",
      message: message,
      okLabel: "ตกลง",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 150,
                        )
                      : Image.file(
                          imgFile!,
                          width: 150,
                        ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: adultCheck,
                        onChanged: (vlaueParam) {
                          setState(() {
                            adultCheck = vlaueParam!;
                            if (vlaueParam == false) {
                              adultCtrl.text = '0';
                            }
                          });
                        }),
                    Text('ผู้ใหญ่ 299 บาท/คน จำนวน '),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: adultCheck,
                        controller: adultCtrl,
                      ),
                    ),
                    Text(" คน"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: childCheck,
                        onChanged: (vlaueParam) {
                          setState(() {
                            childCheck = vlaueParam!;
                            if (vlaueParam == false) {
                              childCtrl.text = '0';
                            }
                          });
                        }),
                    Text('เด็ก 69 บาท/คน จำนวน'),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: childCheck,
                        controller: childCtrl,
                      ),
                    ),
                    Text(" คน"),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: waterCheck,
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                          if (valueParam == 1) {
                            cokeCtrl.text = '0';
                            pureCtrl.text = '0';
                          }
                        });
                      },
                    ),
                    Text('รับ 25 บาท/หัว')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: waterCheck,
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                        });
                      },
                    ),
                    Text('ไม่รับ')
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text('โค้ด 20 บาท/ขวด จำนวน '),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: cokeCtrl,
                        enabled: waterCheck == 2 ? true : false,
                      ),
                    ),
                    Text(" ขวด"),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text('น้ำเปล่า 15 บาท/ขวด จำนวน'),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: pureCtrl,
                        enabled: waterCheck == 2 ? true : false,
                      ),
                    ),
                    Text(" ขวด"),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                //? dropdown ประเภทสมาชิก
                DropdownButton(
                  value: showDiscount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem(
                          value: memberType.indexOf(e).toDouble(),
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    int index = valueParam!.toInt();
                    setState(() {
                      showDiscount = valueParam;
                      switch (index) {
                        case 0.0:
                          discount = 0;
                          break;
                        case 1.0:
                          discount = 0.05;
                          break;
                        case 2.0:
                          discount = 0.2;
                          break;
                      }
                    });
                  },
                ),
                //? button ปุ่ม
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          //? validate ui
                          if (imgFile == null) {
                            await showValidationDialog(
                                context, "กรุณาถ่ายรูปก่อน");
                          } else if (adultCheck == false &&
                              (adultCtrl.text == '0' ||
                                  adultCtrl.text.isEmpty)) {
                            await showValidationDialog(
                                context, "กรุณากรอกจำนวนผู้ใหญ่ให้ถูกต้อง");
                          } else if (childCheck == false &&
                              (childCtrl.text == '0' ||
                                  childCtrl.text.isEmpty)) {
                            await showValidationDialog(
                                context, "กรุณากรอกจำนวนเด็กให้ถูกต้อง");
                          } else {
                            //? พร้อมคำนวณ
                            int adult = int.parse(adultCtrl.text);
                            int child = int.parse(childCtrl.text);
                            int coke = int.parse(cokeCtrl.text);
                            int pure = int.parse(pureCtrl.text);
                            double payWaterBuffe =
                                waterCheck == 1 ? 25.0 * (adult + child) : 0;
                            double payTotal = (299.0 * adult) +
                                (69.0 * child) +
                                (20.0 * coke) +
                                (15.0 * pure) +
                                payWaterBuffe;
                            //? คิดที่ต้องจ่ายหลังหักส่วนลด
                            payTotal = payTotal - (payTotal * discount);
                            //? นำผลลัพธืที่ได้ไปยัง show_bill_ui
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowBillUI(
                                  payTotal: payTotal,
                                  imgFile: imgFile,
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คํานวณเงิน',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 50),
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            adultCheck = false;
                            childCheck = false;
                            waterCheck = 1;
                            discount = 0;
                            imgFile = null;
                            adultCtrl.text = '0';
                            childCtrl.text = '0';
                            cokeCtrl.text = '0';
                            pureCtrl.text = '0';
                          });
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 50),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
