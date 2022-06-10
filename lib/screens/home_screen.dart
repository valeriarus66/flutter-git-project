import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/screens/currency_screen.dart';
import 'package:flutter_project2/screens/welcome_screen.dart';

import '../managers/google_log_in.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
//  List<Currency> currency_list = parseCurrency(dummyResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else if (snapshot.hasData) {
          if (GoogleSignInProvider.isGoogleLogIn) {
            return CurrencyScreen();
          }
          else return WelcomeScreen();
        } else if (snapshot.hasError) {
          return Center(child: Text("Something went wrong!"));
        } else
          return LogInScreen();
      },
    ));
  }
}
