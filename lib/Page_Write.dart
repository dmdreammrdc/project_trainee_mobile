import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'package:http/http.dart' as http;

// คลาส Write
class Write extends StatefulWidget {
  const Write({super.key});

  @override
  _WriteState createState() => _WriteState();
}

// class จังหวัด
// class Province {
//   final String name;
//   Province(this.name);
//   factory Province.fromJson(Map<String, dynamic> json) {
//     return Province(json['name_th']);
//   }
// }

class _WriteState extends State<Write> {
  File? _image;
  TextEditingController _dateController = TextEditingController(); // เพิ่มข้อความลงกล่อง สำหรับวันที่
  double width = 0; // กำหนดค่าเริ่มต้นของ width เป็น 0
  double length = 0; // กำหนดค่าเริ่มต้นของ length เป็น 0
  String? selectedProvince;

  final List<String> provinces = [
    'กระบี่', 'กรุงเทพมหานคร', 'กาญจนบุรี', 'กาฬสินธุ์', 'กำแพงเพชร','ขอนแก่น','จันทบุรี','ฉะเชิงเทรา','ชลบุรี', 'ชัยนาท', 'ชัยภูมิ', 'ชุมพร', 'เชียงราย', 
    'เชียงใหม่','ตรัง', 'ตราด', 'ตาก','นครนายก', 'นครปฐม', 'นครพนม', 'นครราชสีมา', 'นครศรีธรรมราช', 'นครสวรรค์', 'นนทบุรี', 'นราธิวาส', 'น่าน','บึงกาฬ', 
    'บุรีรัมย์','ปทุมธานี', 'ประจวบคีรีขันธ์', 'ปราจีนบุรี', 'ปัตตานี','พระนครศรีอยุธยา', 'พะเยา', 'พังงา', 'พัทลุง', 'พิจิตร', 'พิษณุโลก', 'เพชรบุรี', 'เพชรบูรณ์', 
    'แพร่','ภูเก็ต','มหาสารคาม', 'มุกดาหาร', 'แม่ฮ่องสอน','ยโสธร', 'ยะลา','ร้อยเอ็ด', 'ระนอง', 'ระยอง', 'ราชบุรี','ลพบุรี', 'ลำปาง', 'ลำพูน', 'เลย',
    'ศรีสะเกษ','สกลนคร', 'สงขลา', 'สตูล', 'สมุทรปราการ', 'สมุทรสงคราม', 'สมุทรสาคร', 'สระแก้ว', 'สระบุรี', 'สิงห์บุรี', 'สุโขทัย', 'สุพรรณบุรี', 'สุราษฎร์ธานี',
    'สุรินทร์','หนองคาย', 'หนองบัวลำภู','อ่างทอง', 'อำนาจเจริญ', 'อุดรธานี', 'อุตรดิตถ์', 'อุทัยธานี', 'อุบลราชธานี'];

  // final Map<String, List<String>> districts = {
  //   'กระบี่': ['เมือง', 'เหนือคลอง', 'เขาพนม', 'คลองท่อม', 'อ่าวลึก', 'ปลายพระยา', 'ลำทับ', 'เกาะลันตา'],
  //   // กทม เป็นเขต
  //   'กรุงเทพมหานคร': ['คลองเตย', 'คลองสาน', 'คลองสามวา','คันนายาว', 'จตุจักร', 'จอมทอง','ดอนเมือง', 'ดินแดง', 'ดุสิต', 'ตลิ่งชัน', 'ทวีวัฒนา', 'ทุ่งครุ', 'ธนบุรี', 'บางเขน', 'บางแค','บางกอกใหญ่', 'บางกอกน้อย', 'บางกะปิ', 'บางขุนเทียน','บางคอแหลม', 'บางซื่อ', 'บางนา', 'บางบอน', 'บางพลัด', 'บางรัก', 'บึงกุ่ม', 'ปทุมวัน', 'ประเวศ', 'ป้อมปราบศัตรูพ่าย', 'พญาไท', 'พระนคร', 'ภาษีเจริญ', 'มีนบุรี', 'ยานนาวา', 'ราชเทวี', 'ราษฎร์บูรณะ', 'ลาดกระบัง', 'ลาดพร้าว', 'วังทองหลาง', 'วัฒนา', 'สวนหลวง', 'สะพานสูง', 'สัมพันธวงศ์', 'สาทร ', 'สายไหม', 'หนองแขม', 'หนองจอก', 'หลักสี่', 'ห้วยขวาง'],
  //   'กาญจนบุรี': ['เมือง', 'ท่าม่วง', 'พนมทวน','ท่ามะกา','ด่านมะขามเตี้ย','บ่อพลอย','ไทรโยค','ห้วยกระเจา','หนองปรือ','เลาขวัญ','ศรีสวัสดิ์','ทองผาภูมิ','สังขละบุรี'],
  //   'กาฬสินธุ์': ['เมือง','กมลาไสย','ยางตลาด','ฆ้องชัย','ดอนจาน','ร่องคำ','สหัสขันธ์','สมเด็จ','นามน','ห้วยเม็ก','ห้วยผึ้ง','หนองกุงศรี','กุฉินารายณ์','คำม่วง','สามชัย','นาคู','ท่าคันโท','เขาวง'],
  //   'กำแพงเพชร': ['เมือง','พรานกระต่าย','โกสัมพีนคร','คลองขลุง','ไทรงาม','คลองลาน','ทรายทองวัฒนา','ลานกระบือ','ขาณุวรลักษบุรี','ปางศิลาทอง','บึงสามัคคี'],
  //   'ขอนแก่น': ['เมือง','เวียงเก่า','บ้านแฮด','บ้านฝาง','พระยืน','ซำสูง','น้ำพอง','บ้านไผ่','หนองเรือ','เขาสวนกวาง','อุบลรัตน์','โนนศิลา','ชนบท','มัญจาคีรี','กระนวน','ภูเวียง','แวงใหญ่','พล','โคกโพธิ์ไชย','เปือยน้อย','หนองนาคำ','ชุมแพ','หนองสองห้อง','แวงน้อย','ภูผาม่าน','สีชมพู'],
  //   'จันทบุรี': ['เมือง','ท่าใหม่','มะขาม','ขลุง','เขาคิชฌกูฏ','แหลมสิงห์','นายายอาม','โป่งน้ำร้อน','สอยดาว','แก่งหางแมว'],
  //   'ฉะเชิงเทรา': ['เมือง','บ้านโพธิ์','คลองเขื่อน','บางน้ำเปรี้ยว','บางปะกง','บางคล้า','พนมสารคาม','ท่าตะเกียบ','แปลงยาว','สนามชัยเขต','ราชสาส์น'],
  //   'ชลบุรี': ['เมือง','บ้านบึง','พนัสนิคม','ศรีราชา','พานทอง','เกาะสีชัง','บางละมุง','เกาะจันทร์','หนองใหญ่','บ่อทอง','สัตหีบ'],
  //   'ชัยนาท': ['เมือง','มโนรมย์','สรรพยา','วัดสิงห์','สรรคบุรี','หันคา','หนองมะโมง','เนินขาม'],
  //   'ชัยภูมิ': ['เมือง','บ้านเขว้า','ซับใหญ่','เนินสง่า','หนองบัวระเหว','จัตุรัส','คอนสวรรค์','แก้งคร้อ','หนองบัวแดง','บำเหน็จณรงค์','ภูเขียว','ภักดีชุมพล','บ้านแท่น','เกษตรสมบูรณ์','เทพสถิต','คอนสาร'],
  //   'ชุมพร': ['เมือง','ปะทิว','ท่าแซะ','สวี','ทุ่งตะโก','หลังสวน','ละแม','พะโต๊ะ'],
  //   'ตรัง': ['เมือง','นาโยง','ย่านตาขาว','กันตัง','ห้วยยอด','สิเกา','ปะเหลียน','รัษฎา','หาดสำราญ','วังวิเศษ'],
  //   'ตราด': ['เมือง','เขาสมิง','แหลมงอบ','เกาะช้าง','บ่อไร่','คลองใหญ่','เกาะกูด'],
  //   'ตาก': ['เมือง','บ้านตาก','วังเจ้า','สามเงา','แม่สอด','แม่ระมาด','พบพระ','ท่าสองยาง','อุ้มผาง'],
  //   'นครนายก': ['เมือง','ปากพลี','บ้านนา','องครักษ์',],
  //   'นครปฐม': ['เมือง','นครชัยศรี','พุทธมณฑล','สามพราน','กำแพงแสน','ดอนตูม','บางเลน'],
  //   'นครพนม': ['เมือง','ท่าอุเทน','ปลาปาก','โพนสวรรค์','เรณูนคร','ธาตุพนม','วังยาง','ศรีสงคราม','นาแก','บ้านแพง','นาหว้า','นาทม'],
  //   'นครราชสีมา': ['เมือง','ขามทะเลสอ','โนนไทย','โชคชัย','เฉลิมพระเกียรติ','โนนแดง','ปักธงชัย','สูงเนิน','โนนสูง','จักราช','สีคิ้ว','ขามสะแกแสง','พระทองคำ',
  //                 'หนองบุญมาก','ครบุรี','พิมาย','ห้วยแถลง','วังน้ำเขียว','คง','ด่านขุนทด','ปากช่อง','บ้านเหลื่อม','เสิงสาง','เทพารักษ์','ประทาย','ชุมพวง',
  //                 'บัวใหญ่','เมืองยาง','แก้งสนามนาง','บัวลาย','สีดา','ลำทะเมนชัย'],
  //   'นครศรีธรรมราช': ['เมือง','ขนอม','ท่าศาลา','ทุ่งสง','ปากพนัง','ฉวาง','ชะอวด','ร่อนพิบูลย์','สิชล','หัวไทร','เชียรใหญ่','ทุ่งใหญ่','นาบอน','เฉลิมพระเกียรติ',
  //                   'จุฬาภรณ์','ช้างกลาง','ถ้ำพรรณรา','นบพิตำ','บางขัน','พรหมคีรี','พระพรหม','พิปูน','ลานสกา'],
  //   // 'นครสวรรค์': ['','','','','','','','','','',''],
  //   // 'นนทบุรี': ['','','','','','','','','','',''],
  //   // 'นราธิวาส': ['','','','','','','','','','',''],
  //   // 'น่าน': ['','','','','','','','','','',''],
  //   // 'บึงกาฬ': ['','','','','','','','','','',''],
  //   // 'บุรีรัมย์': ['','','','','','','','','','',''],
  //   // 'ปทุมธานี': ['','','','','','','','','','',''],
  //   // 'ประจวบคีรีขันธ์': ['','','','','','','','','','',''],
  //   // 'ปราจีนบุรี',
  //   // 'ปัตตานี',
  //   // 'พระนครศรีอยุธยา',
  //   // 'พะเยา',
  //   // 'พังงา',
  //   // 'พัทลุง',
  //   // 'พิจิตร',
  //   // 'พิษณุโลก',
  //   // 'ภูเก็ต',
  //   // 'มหาสารคาม',
  //   // 'มุกดาหาร',
  //   // 'ยะลา',
  //   // 'ยโสธร',
  //   // 'ระนอง',
  //   // 'ระยอง',
  //   // 'ราชบุรี',
  //   // 'ร้อยเอ็ด',
  //   // 'ลพบุรี',
  //   // 'ลำปาง',
  //   // 'ลำพูน',
  //   // 'ศรีสะเกษ',
  //   // 'สกลนคร',
  //   // 'สงขลา',
  //   // 'สตูล',
  //   // 'สมุทรปราการ',
  //   // 'สมุทรสงคราม',
  //   // 'สมุทรสาคร',
  //   // 'สระบุรี',
  //   // 'สระแก้ว',
  //   // 'สิงห์บุรี',
  //   // 'สุพรรณบุรี',
  //   // 'สุราษฎร์ธานี',
  //   // 'สุรินทร์',
  //   // 'สุโขทัย',
  //   // 'หนองคาย',
  //   // 'หนองบัวลำภู',
  //   // 'อำนาจเจริญ',
  //   // 'อุดรธานี',
  //   // 'อุตรดิตถ์',
  //   // 'อุทัยธานี',
  //   // 'อุบลราชธานี',
  //   // 'อ่างทอง',
  //   // 'เชียงราย',
  //   // 'เชียงใหม่',
  //   // 'เพชรบุรี',
  //   // 'เพชรบูรณ์',
  //   // 'เลย',
  //   // 'แพร่',
  //   // 'แม่ฮ่องสอน'
  // };
    
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ลบ debug
      home: Scaffold(
        appBar: AppBar(
            title: Text('กรอกเอกสาร ภ.ป.1', style: TextStyle(fontSize: 26, color: Colors.black)),
            centerTitle: true, // ตัวอักษรอยู่ตรงกลาง
            backgroundColor: Color.fromRGBO(238, 217, 209, 1), // พื้นหลังข้างบน
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),color: Colors.brown, // เปลี่ยน icon และ สี ตามที่ต้องการ
            ),
          ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0), // กำหนดระยะห่างแต่ละด้านตามลำดับ (ซ้าย, บน, ขวา, ล่าง)
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('แบบแสดงรายการภาษี ประจำ พ.ศ.2567', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 40, // กำหนดความสูงของกล่องข้อความ
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ชื่อเจ้าของป้าย *',
                    ),
                  ), // บรรทัดแรกของการใส่ข้อมูล
                ),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 40, // กำหนดความสูงของกล่องข้อความ
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ชื่อสถานประกอบการค้าหรือกิจการอื่นๆ *',
                    ),
                  ), // บรรทัด 2 ของการใส่ข้อมูล
                ),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                Row(
                  children: [
                    Container(
                      width: 100, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'เลขที่ *',
                        ),
                      ),
                    ),
                    SizedBox(width: 5), // ระยะห่างระหว่างกล่องข้อความ
                    Container(
                      width: 130, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ตรอก/ซอย *',
                        ),
                      ),
                    ),
                    SizedBox(width: 5), // ระยะห่างระหว่างกล่องข้อความ
                    Container(
                      width: 120, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ถนน *',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                Row(
                  children: [
                    Container(
                      width: 90, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'หมู่ที่ *',
                        ),
                      ),
                    ),
                    SizedBox(width: 5), // ระยะห่างระหว่างกล่องข้อความ
                    Container(
                      width: 120, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ตำบล/แขวง *',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                //อำเภอ
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 70, // กำหนดความสูงของกล่องข้อความ
                  child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'อำเภอ/เขต *',
                        ),
                  ),
                ),
                //จังหวัด
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 70, // กำหนดความสูงของกล่องข้อความ
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'จังหวัด *',
                    ),
                    value: selectedProvince,
                    items: provinces.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedProvince = newValue;
                      });
                    },
                  ),
                ),
                // Column(
                //   children: [
                //     // Your UI components here
                //     DropdownButton<String>(
                //       value: selectedProvince,
                //       hint: Text('โปรดเลือกจังหวัด'),
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           selectedProvince = newValue;
                //         });
                //       },
                //       items: provinces.map<DropdownMenuItem<String>>((Province province) {
                //         return DropdownMenuItem<String>(
                //           value: province.name,
                //           child: Text(province.name),
                //         );
                //       }).toList(),
                //     ),
                //     SizedBox(height: 20),
                //     Text(
                //       'คุณเลือก: ${selectedProvince ?? "ยังไม่ได้เลือก"}',
                //       style: TextStyle(fontSize: 18),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 100), // ระยะห่างระหว่างกล่องข้อความ
                // โทรศัพท์
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 40, // กำหนดความสูงของกล่องข้อความ
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'โทรศัพท์ *',
                    ),
                  ),
                ),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                Text('ขอยื่นแบบแสดงรายการภาษีป้ายต่อพนักงานเจ้าหน้าที่ ณ ศูนย์ราชการนนทบุรี ตามรายการต่อไปนี้'),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                //ประเภทป้าย
                Container(
                      width: 340, // กำหนดความกว้างของกล่องข้อความ
                      height: 60, // กำหนดความสูงของกล่องข้อความ
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ประเภทป้าย *',
                        ),
                        items: <String>[
                          '1.มีอักษรไทยล้วน ที่เคลื่อนที่หรือเปลี่ยนข้อความ\n (ป้ายไฟวิ่ง)',
                          '2.มีอักษรไทยล้วน (ป้ายติดทั่วไป)',
                          '3.มีอักษรไทยปนอักษรต่างประเทศหรือ\nเครื่องหมายอื่นที่เคลื่อนที่หรือเปลี่ยนได้ (ป้ายไฟวิ่ง)',
                          '4.มีอักษรไทยปนอักษรต่างประเทศหรือ\nเครื่องหมายอื่น (ป้ายติดทั่วไป)',
                          '5.ป้ายที่ไม่มีอักษรไทย หรือป้ายที่มีอักษรไทย\nบางส่วนหรือทั้งหมดอยู่ใต้\nหรือต่ำกว่าอักษรต่างประเทศ\nที่เคลื่อนที่หรือเปลี่ยนได้ (ป้ายไฟวิ่ง)',
                          '6.ป้ายที่ไม่มีอักษรไทย หรือป้ายที่มีอักษรไทย\nบางส่วนหรือทั้งหมดอยู่ใต้\nหรือต่ำกว่าอักษรต่างประเทศ (ป้ายติดทั่วไป)'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {});
                        },
                      ),
                    ),
                SizedBox(height: 5), // ระยะห่างระหว่างกล่องข้อความ
                    Container(
                      width: 120, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'จำนวนป้าย *',
                        ),
                      ),
                    ),
                // กล่องเพิ่มรูปภาพ
                SizedBox(height: 2,),
                Text('ตัวอย่างป้าย', style: TextStyle(color: Colors.black, fontSize: 14)),
                Padding(
                  padding: EdgeInsets.only(),
                  child: 
                    Row(children: [
                    GestureDetector(
                      onTap: () => _pickImage(ImageSource.gallery),
                      child: 
                      Container(
                        width: 312, // กำหนดความกว้างของกล่อง
                        height: 70, // กำหนดความสูงของกล่อง
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
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.photo_library),
                            onPressed: () => _pickImage(ImageSource.gallery),
                            tooltip: 'เลือกรูปภาพจากแกลลอรี่',
                          ),
                          SizedBox(height: 0,),
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
                // กล่องขนาดของป้าย
                Text('ขนาดของป้าย', style: TextStyle(color: Colors.black,fontSize: 14,),),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Container(
                      width: 120, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'กว้าง (ซ.ม.) *',
                        ),
                      ),
                    ),
                    SizedBox(width: 5), 
                    Container(
                      width: 115, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'ยาว (ซ.ม.) *',),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 115, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'เนื้อที่ (ตาราง ซ.ม.)*',),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2,),
                Text('ข้อความหรือภาพหรือเครื่องหมายที่ปรากฎในป้ายโดยย่อ *', style: TextStyle(fontSize: 14)),
                SizedBox(height: 2,),
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 40, // กำหนดความสูงของกล่องข้อความ
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ข้อความหรือภาพหรือเครื่องหมายที่ปรากฎในป้ายโดยย่อ *',
                    ),
                  ), // บรรทัดแรกของการใส่ข้อมูล
                ),
                SizedBox(height: 2,),
                Text('สถานที่ติดตั้งป้ายและวันติดตั้ง (แสดงป้าย) ถนน, ตรอก, ซอย, ตำบล, อำเภอ, สถานที่ใกล้เคียง หรือ ระหว่าง ก.ม. ที่ *', style: TextStyle(fontSize: 14)),
                SizedBox(height: 2,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: Container(
                          width: 165, // กำหนดความกว้างของกล่องข้อความ
                          height: 40, // กำหนดความสูงของกล่องข้อความ
                          child: TextField(
                            controller: _dateController,  // แสดงข้อความ วันที่ เมื่อเรากดเลือกแล้ว
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'วันที่ติดตั้งป้าย *',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      width: 190, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'สถานที่ติดตั้งป้าย *',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  width: 360, // กำหนดความกว้างของกล่องข้อความ
                  height: 40, // กำหนดความสูงของกล่องข้อความ
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'หมายเหตุ',
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('ที่ต้องชำระ', style: TextStyle(color: const Color.fromARGB(255, 128, 90, 76), fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(width: 30),
                    Container(
                      width: 230, // กำหนดความกว้างของกล่องข้อความ
                      height: 40, // กำหนดความสูงของกล่องข้อความ
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ไตรมาสที่ติดตั้งป้าย *',
                        ),
                        items: <String>[
                          'ไตรมาส 1 (มกราคม - มีนาคม)',
                          'ไตรมาส 2 (เมษายน - มิถุนายน)',
                          'ไตรมาส 3 (กรกฎาคม - กันยายน)',
                          'ไตรมาส 4 (ตุลาคม - ธันวาคม)',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 227, 208, 185),  
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white,),label: 'ย้อนกลับ',),
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white,),label: 'หน้าแรก',),
            BottomNavigationBarItem(icon: Icon(Icons.border_color, color: Colors.white,),label: 'ชำระเงิน',),
            ],
            elevation: 0, // ตั้งค่า elevation เป็น 0 เพื่อลบเงา
          ),
      ),
    );
  }
}

// // คลาส Provinces
// class Provinces extends StatefulWidget {
//   final ValueChanged<String?>? onChanged;
//   final String? selectedProvince;

//   const Provinces({Key? key, this.onChanged, this.selectedProvince}) : super(key: key);

//   @override
//   _ProvinceState createState() => _ProvinceState();
// }

// class _ProvinceState extends State<Provinces> {
//   List<String> provinces = [];

//   @override
//   void initState() {
//     super.initState();
//     _provincesData();
//   }

//   Future<void> _provincesData() async {
//     final response = await http.get(Uri.parse('https://github.com/kongvut/thai-province-data/blob/master/json/thai_provinces.json'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);

//       List<String> provinceNames = data.map<String>((dynamic item) {
//         return item['name_th'] as String;
//       }).toList();

//       setState(() {
//         provinces = provinceNames;
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
  
//   // ฟังก์ชันสำหรับสร้าง DropdownButton
//   @override
//   Widget build(BuildContext context) {
//     return provinces.isEmpty
//         ? CircularProgressIndicator()
//         : DropdownButton<String>(
//             value: widget.selectedProvince,
//             hint: Text('จังหวัด *'),
//             items: provinces.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: widget.onChanged,
//           );
//   }
// }