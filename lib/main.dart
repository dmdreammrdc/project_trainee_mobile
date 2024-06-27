import 'package:flutter/material.dart';
//import 'package:my_application_trainee/Page_Menu.dart';
//import 'package:my_application_trainee/Page_Detail.dart';
import 'package:my_application_trainee/Page_Write.dart';
//import 'package:my_application_trainee/Page_Cash.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 251, 251, 251),
    ),
    //home: Menu(),
    //home: Detail(),
    home: Write(),
    //home: Cash(),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          
        ],
      )),
    );
  }
}