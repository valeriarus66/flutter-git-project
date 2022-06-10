
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/helpers-constants/strings.dart';
import 'package:flutter_project2/managers/authentication_manager.dart';
import 'package:flutter_project2/managers/google_log_in.dart';
import 'package:flutter_project2/screens/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'currency_screen.dart';

class LogInScreen extends StatefulWidget{

  const LogInScreen({Key? key}) : super(key: key);
  static const routeName = 'login';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  String _email = "";
  String _password = "";
  /// fa authentication si pt sing in


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appBarLogInTitle), //widget.title
        centerTitle: true,
      ),

      body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),

                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(vertical: 35),
                  child: Text(
                    "MyMoney",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 40,
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
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 65,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      final String email = _email;
                      final String password = _password;
                      if(email.isEmpty){
                        SnackBar initEmail = const SnackBar(content: const Text("Email is mandatory"),);
                        ScaffoldMessenger.of(context).showSnackBar(initEmail);

                      }else {
                        if(password.isEmpty || password.isEmpty && email.isNotEmpty){
                          SnackBar initPassword = const SnackBar(content: const Text("Password is mandatory"),);
                          ScaffoldMessenger.of(context).showSnackBar(initPassword);
                        }else {
                          context.read<AuthenticationManager>().logInUser(
                              email: _email,
                              password: _password
                          );
                        }
                      }
                      const SizedBox(height: 25);
                    },
                    child: Text(
                      loginButtonTitle,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 65,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {

                      final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogIn();
                      GoogleSignInProvider.isGoogleLogIn = true;
                    },
                    icon: FaIcon(FontAwesomeIcons.google, color:Colors.white),
                    label: Text(
                      "Log in with Google",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
  /*
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
  */

}
