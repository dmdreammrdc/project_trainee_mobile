import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail ({super.key});

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // ลบ debug
      home: Scaffold(
        appBar: AppBar(
          title: Text('ยื่นคำร้อง' , style: TextStyle(fontSize: 26, color: Colors.black)), //ข้อความที่ต้องการแสดง
          centerTitle: true, //ตัวอักษรอยู่ตรงกลาง
          backgroundColor: Color.fromRGBO(238, 217, 209, 1),//พื้นหลังข้างบน
          leading:IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu), color: Colors.brown, // เปลี่ยน icon และ สี ตามที่ต้องการ
          ),
        ),
        body:Container(
          padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0), // กำหนดระยะห่างแต่ละด้านตามลำดับ (ซ้าย, บน, ขวา, ล่าง)
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 3),
                  child: 
                    Text('ขั้นตอนการขอใช้บริการ', 
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 23, 105, 171),),),
                ),
                Padding( 
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: Row(
                    children: [
                      Icon(Icons.edit_document, color: Colors.red,),
                      SizedBox(width: 25), // ระยะห่างระหว่างไอคอน
                      Icon(Icons.arrow_forward, color: Colors.red,),
                      SizedBox(width: 23), // ระยะห่างระหว่างไอคอน
                      Icon(Icons.work_history, color: Colors.green,),
                      SizedBox(width: 28), // ระยะห่างระหว่างไอคอน
                      Icon(Icons.arrow_forward, color: Colors.green,),
                      SizedBox(width: 20), // ระยะห่างระหว่างไอคอน
                      Icon(Icons.assignment, color: Colors.orange,),
                      SizedBox(width: 23), // ระยะห่างระหว่างไอคอน
                      Icon(Icons.arrow_forward, color: Colors.orange,),
                      SizedBox(width: 30), // ระยะห่างระหว่างไอคอน
                      Icon(Icons.task, color: Colors.purple,),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, top: 5),
                  child: Row(
                    children: [
                      Text('ขั้นตอนที่ 1', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red,),),
                      SizedBox(width: 25), // ระยะห่างระหว่างไอคอน
                      Text('ขั้นตอนที่ 2', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green,),),
                      SizedBox(width: 27), // ระยะห่างระหว่างไอคอน
                      Text('ขั้นตอนที่ 3', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange,),),
                      SizedBox(width: 30), // ระยะห่างระหว่างไอคอน
                      Text('ขั้นตอนที่ 4', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.purple,),),
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, top: 5),
                  child: Row(
                    children: [
                      Text('ยื่นแบบแสดง\nรายการ ภ.ป.1', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,),),
                      SizedBox(width: 33), // ระยะห่างระหว่างไอคอน
                      Text('ตรวจสอบ\nหลักฐาน', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,),),
                      SizedBox(width: 30), // ระยะห่างระหว่างไอคอน
                      Text('คำนวณภาษีและ\nแจ้งการประเมิน', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,),),
                      SizedBox(width:15), // ระยะห่างระหว่างไอคอน
                      Text('   ชำระภาษีและ\nออกใบเสร็จรับเงิน', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black,),),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey, // สีของเส้นคั่น
                  thickness: 2, // ความหนาของเส้นคั่น
                  height: 30, // ความสูงของเส้นคั่น
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: 
                    Text('หลักฐานที่ใช้ในการเสียภาษีป้าย', 
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 23, 105, 171),),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: 
                      Text('กรณีติดตั้งใหม่', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, right: 7, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1.ใบอนุญาตติดตั้งป้ายหรือใบเสร็จรับเงินจากร้านทำป้าย', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                      Text('2.รูปถ่ายป้าย,วัดขนาดความกว้าง x ยาว', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                      Text('3.สำเนาทะเบียนบ้าน', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                      Text('5.กรณีเจ้าของป้ายเป็นนิติบุคคลให้แนบหนังสือรับรองสำนักงาน , ทะเบียนหุ้นส่วนบริษัท , ทะเบียนพาณิชย์ หรือ หลักฐานของสรรพากร เช่น ภ.พ.๐๑ , ภ.พ.๐๙ , ภ.พ. ๒๐', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                      Text('6.หนังสือมอบอำนาจ (กรณีไม่สามารถยื่นแบบได้ด้วยตนเองพร้อมติดอากรแสตมป์ตามกฎหมาย)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                    ],
                  ), 
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: 
                      Text('กรณีภาษีป้าย ( รายเก่า ) ที่ยื่นชำระทุกปี', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7, right: 7, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1.ให้เจ้าของป้ายยื่นแบบภาษีป้าย ( ภ.ป. ๑ ) พร้อมใบเสร็จรับเงินการเสียภาษีครั้งสุดท้าย', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                      Text('2.กรณีเจ้าของป้ายเป็นนิติบุคคลให้แนบหนังสือรับรองสำนักงานทะเบียนหุ้นส่วนบริษัทพร้อมกับการยื่นแบบ ภ.ป. ๑', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
                      Text('3.หนังสือมอบอำนาจ ( กรณีไม่สามารถยื่นแบบได้ด้วยตนเองพร้อมติดอากรแสตมป์ตามกฎหมาย ) และ ใบเสร็จรับเงินเสียภาษีครั้งสุดท้าย ( ถ้ามี )', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black,),),
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
            BottomNavigationBarItem(icon: Icon(Icons.border_color, color: Colors.white,),label: 'กรอกข้อมูล',),
            ],
            elevation: 0, // ตั้งค่า elevation เป็น 0 เพื่อลบเงา
          ),
      ),
    );
  }
}