
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/helpers-constants/strings.dart';
import 'package:flutter_project2/managers/authentication_manager.dart';
import 'package:flutter_project2/screens/signup_screen.dart';

import 'currency_screen.dart';

class LogInScreen extends StatefulWidget{

  const LogInScreen({Key? key}) : super(key: key);
  static const routeName = 'login';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _form = GlobalKey<FormState>();
  bool _isValidEmail = false;
  bool _isValidPassword = false;

  String _email = "";
  String _password = "";
  /// fa authentication si pt sing in


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appBarLogInTitle), //widget.title
      ),

      body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    onChanged: (newValue){
                      _email = newValue;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelTextEmail,
                        hintText: hintTextEmail),
                    keyboardType: TextInputType.emailAddress,

                  ),
                ),
                Padding(
                 // padding: //const EdgeInsets.only(
                     // left: 15.0, right: 15.0, top: 15, bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextField(
                    onChanged: (newValue){
                      _password = newValue;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelTextPassword,
                        hintText: hintTextPassword),
                    keyboardType: TextInputType.visiblePassword,

                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text('Forgot Password',),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(),
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isValid = validateFields();
                      if(isValid){
                        Navigator.pushNamed(
                          context,
                          CurrencyScreen.routeName,
                          //SignUpScreen.routeName,
                        );
                      }
                    //  _saveFormEmail();
                      const SizedBox(height: 25);

                    },
                    child: Text(
                      loginButtonTitle,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  height:50,
                  width:250,
                  child: TextButton(
                      onPressed:(){
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.redAccent[700], fontSize: 15)
                    ),

                  )
                )
              ],
            )
      ),
    );
  }
  void authenticateUser(){
    AuthenticationManager _authenticationManager = AuthenticationManager();
    _authenticationManager.logInUser(_email, _password);
  }

bool validateFields(){
    if(_email.isNotEmpty && _password.isNotEmpty) {
      authenticateUser();
      return true;
    }
    else{
      SnackBar initSnackbar = const SnackBar(content: const Text("Email and password are mandatory"),);
      ScaffoldMessenger.of(context).showSnackBar(initSnackbar);
    }
    return false;
  }
}
