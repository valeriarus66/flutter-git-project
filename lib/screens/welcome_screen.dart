
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/managers/authentication_manager.dart';

import 'package:provider/provider.dart'; //as rootBundle;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = "WelcomeScreen";

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<WelcomeScreen> {
//  List<Welcome> Welcome_list = parseWelcome(dummyResponse);

  @override
  Widget build(BuildContext context) {
   // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          shadowColor: Colors.black,
          toolbarHeight: 70,
          elevation: 35,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.elliptical(10, 20)),
          ),
          title: const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                context.read<AuthenticationManager>().logOutUser();
              },
              child: Text("Sign out",
                  style: TextStyle(
                    color: Colors.limeAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
        body: Container(
            alignment: Alignment.center,
            color: Colors.limeAccent.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to our app",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
        ),
    );
  }
}