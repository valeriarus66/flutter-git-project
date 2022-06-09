import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/managers/authentication_manager.dart';
import 'package:flutter_project2/screens/currency_screen.dart';
import 'package:flutter_project2/screens/login_screen.dart';

import 'package:flutter_project2/screens/signup_screen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<AuthenticationManager>(
          create: (context) => AuthenticationManager(FirebaseAuth.instance),
        ),

        StreamProvider(
            create: (context)=> context.read<AuthenticationManager>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
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
          // initialRoute: LogInScreen.routeName,
          home: AuthenticationWrapper(),
          routes:{
            LogInScreen.routeName:(context) => LogInScreen(),
            SignUpScreen.routeName:(context) => SignUpScreen(),
            CurrencyScreen.routeName:(context) => CurrencyScreen(),
          }
      ),
    );

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
     // initialRoute: LogInScreen.routeName,
    home: AuthenticationWrapper(),
      routes:{
        LogInScreen.routeName:(context) => LogInScreen(),
       SignUpScreen.routeName:(context) => SignUpScreen(),
        CurrencyScreen.routeName:(context) => CurrencyScreen(),
      }
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
  if (firebaseUser != null){
    return CurrencyScreen();
  }
  return LogInScreen();

  }
}
