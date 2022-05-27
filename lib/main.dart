import 'package:flutter/material.dart';
import 'package:flutter_project2/screens/currency_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.lime,
        primaryColor: Colors.limeAccent[400],
        //MaterialColor(
         // 1,{1:Colors.limeAccent[400]!}),
      //  scaffoldBackgroundColor: Colors.pinkAccent[400],
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: LogInScreen.routeName,
      routes:{
        LogInScreen.routeName:(context) => LogInScreen(),
       SignUpScreen.routeName:(context) => SignUpScreen(),
        CurrencyScreen.routeName:(context) => CurrencyScreen(),
      }
    );
  }
}
