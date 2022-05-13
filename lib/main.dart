import 'package:flutter/material.dart';
import 'package:flutter_project2/screens/login_screen.dart';
import 'package:flutter_project2/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     // theme: ThemeData(
       // primarySwatch: Colors.blue,
     // ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: LogInScreen.routeName,
      routes:{
        LogInScreen.routeName:(context) => LogInScreen(),
        SignUpScreen.routeName:(context) => SignUpScreen()
      }
    );
  }
}
