import 'package:flutter/material.dart';

//import './Page_Menu.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // ลบ debug
      home : Scaffold(
        //Image.asset('images/background.jpg',width: 300,height: 100,),
        appBar : AppBar(
          title : Text('ภาษีป้าย' , style: TextStyle(fontSize: 26, color: Colors.black)), //ข้อความที่ต้องการแสดง
          centerTitle: true, //ตัวอักษรอยู่ตรงกลาง
          backgroundColor: Color.fromRGBO(238, 217, 209, 1),  //พื้นหลังข้างบน
          //leading: Icon(Icons.menu, color: Colors.white), // เพิ่ม icon ด้านหน้าข้อความ
          actions: [
              IconButton(onPressed: () => {}, icon: Icon(Icons.close, color: Colors.white)), //เพิ่ม icon ด้านหลังข้อความ
          ],
        ),
        body: 
          Container(
            
          //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.cover,),),// ใช้เพื่อให้ภาพเต็มพื้นที่),
          //color: Colors.amber, // สีพื้นหลัง
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0), // กำหนดระยะห่างแต่ละด้านตามลำดับ (ซ้าย, บน, ขวา, ล่าง)
              child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children:[
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                          onPressed: () {}, 
                          icon : Icon(Icons.home, color: Colors.brown), 
                          label: Text('หน้าแรก', style: TextStyle(fontSize: 20, color: Colors.black),),
                        ),
                        ), 
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.menu_book, color: Colors.brown),
                            label: Text('ข่าวประชาสัมพันธ์', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ), 
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.send, color: Colors.brown),
                            label: Text('ยื่นคำร้อง', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ), 
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.receipt, color: Colors.brown,),
                            label: Text('ใบเสร็จรับเงินภาษี', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ), 
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.save, color: Colors.brown),
                            label: Text('บันทึกการตรวจสอบ', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.article, color: Colors.brown),
                            label: Text('ใบแสดงรายการภาษี', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ), 
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.file_present, color: Colors.brown,),
                            label: Text('หนังสือแจ้งการประเมิน', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ), 
                      ),
                      SizedBox(height: 15,),
                      Center(
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton.icon(
                            onPressed: () {}, 
                            icon: Icon(Icons.text_snippet, color: Colors.brown),
                            label: Text('แบบอุทธรณ์ภาษีป้าย', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ),   //ทำให้ปุ่มอยู่ตรงกลาง
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('แบบแจ้งคำวินิจฉัยอุทธรณ์ภาษีป้าย', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Center(   //ทำให้ปุ่มอยู่ตรงกลาง
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 50), // กำหนดขนาดเท่ากันทั้งความยาวและความกว้าง
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('สถานะการทำงาน', style: TextStyle(fontSize: 20, color: Colors.black),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 227, 208, 185),  
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,),label: 'หน้าแรก',),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white,),label: 'Login',),
            ],
            elevation: 0, // ตั้งค่า elevation เป็น 0 เพื่อลบเงา
          ),
      ),
    );
  }
}