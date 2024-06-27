import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Cash extends StatefulWidget {
  const Cash({super.key});

  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,  // ลบ debug
        home: Scaffold(
          appBar: AppBar(
            title: Text('ช่องทางการชำระเงิน' , style: TextStyle(fontSize: 26, color: Colors.black)), //ข้อความที่ต้องการแสดง
            centerTitle: true, //ตัวอักษรอยู่ตรงกลาง
            backgroundColor: Color.fromRGBO(238, 217, 209, 1),//พื้นหลังข้างบน
            leading:IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu), color: Colors.brown, // เปลี่ยน icon และ สี ตามที่ต้องการ
            ),
          ),
          body:Container(
            child: SingleChildScrollView(
              child:
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 35),
                    child: Text('เลขบัญชีสำหรับการชำระเงิน',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                  Padding(  //ธนาคารบรรทัดแรก
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text('ธนาคารกสิกรไทย', style: TextStyle(fontSize: 14, color: Colors.black,),),
                        SizedBox(width: 100), // ระยะห่างระหว่างไอคอน
                        Text('ธนาคารกรุงไทย', style: TextStyle(fontSize: 14, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 75), // ระยะห่างระหว่างไอคอน
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 20), // ระยะห่างระหว่างไอคอน
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(  //ธนาคารบรรทัด 2
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text('ธนาคารกรุงเทพ', style: TextStyle(fontSize: 14, color: Colors.black,),),
                        SizedBox(width: 100), // ระยะห่างระหว่างไอคอน
                        Text('ธนาคารไทยพาณิชย์', style: TextStyle(fontSize: 14, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 75), // ระยะห่างระหว่างไอคอน
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 20), // ระยะห่างระหว่างไอคอน
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(  //ธนาคารบรรทัด 3
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text('ธนาคารทหารไทย', style: TextStyle(fontSize: 14, color: Colors.black,),),
                        SizedBox(width: 100), // ระยะห่างระหว่างไอคอน
                        Text('ธนาคารออมสิน', style: TextStyle(fontSize: 14, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 75), // ระยะห่างระหว่างไอคอน
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 20), // ระยะห่างระหว่างไอคอน
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(  //ธนาคารบรรทัด 4
                    padding: EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text('ธนาคารกรุงศรีอยุธยา', style: TextStyle(fontSize: 14, color: Colors.black,),),
                        SizedBox(width: 80), // ระยะห่างระหว่างไอคอน
                        Text('ธนาคารธนชาติ', style: TextStyle(fontSize: 14, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 75), // ระยะห่างระหว่างไอคอน
                        Text('เลขบัญชี xxx-x-x1256-x', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                        SizedBox(width: 20), // ระยะห่างระหว่างไอคอน
                        Text('ชื่อบัญชี สำนักงานการเสียภาษีป้าย', style: TextStyle(fontSize: 12, color: Colors.black,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35,top: 10),
                    child: 
                      Text('หลักฐานการโอนเงิน',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _pickImage(ImageSource.gallery),
                          child: 
                          Container(
                            width: 350, // กำหนดความกว้างของกล่อง
                            height: 300, // กำหนดความสูงของกล่อง
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: _image != null
                                ? Image.file(_image!,fit: BoxFit.cover,)
                                : Center(
                          child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [Icon(Icons.camera_alt, size: 25  , color: Colors.grey), Text('อัพโหลดรูปภาพ') ],
                                    ),
                                  ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.photo_library),
                              onPressed: () => _pickImage(ImageSource.gallery),
                              tooltip: 'เลือกรูปภาพจากแกลลอรี่',
                            ),
                            SizedBox(height: 0),
                            IconButton(
                              icon: Icon(Icons.camera_alt),
                              onPressed: () => _pickImage(ImageSource.camera),
                              tooltip: 'ถ่ายรูปภาพใหม่',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 227, 208, 185),  
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white,),label: 'หน้าแรก',),
              BottomNavigationBarItem(icon: Icon(Icons.price_check, color: Colors.white,),label: 'ยืนยันการชำระเงิน',),
              ],
              elevation: 0, // ตั้งค่า elevation เป็น 0 เพื่อลบเงา
          ),
      ),
    );
  }
}