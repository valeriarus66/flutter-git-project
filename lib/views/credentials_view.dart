import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/screens/signup_screen.dart';

import '../helpers-constants/constants.dart';
import '../helpers-constants/strings.dart';

class CredentialsView extends StatefulWidget {
  final String screenTitle;
  final String buttonTitle;
  final String appBarTitle;
  final bool isSignUpScreen;
  late final Color _textColor;

  CredentialsView({
    Key? key,
    required this.screenTitle,
    required this.buttonTitle,
    required this.appBarTitle,
    this.isSignUpScreen = false,
  }) : super(key: key) {
    _textColor =
        (isSignUpScreen ? Colors.deepOrangeAccent[700] : Colors.black)!;
  }
  @override
  //_LogInorSignUpViewState createState() => _LogInorSignUpViewState();
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<CredentialsView> {
  final _form = GlobalKey<FormState>();
  bool _isValidEmail = false;
  bool _isValidPassword = false;

  void _saveFormEmail() {
    setState(() {
      _isValidEmail = _form.currentState!.validate();
      _isValidPassword = _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle), //widget.title
      ),
      body: Center(
        //the Form here
        child: Form(
            key: _form,
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
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelTextEmail,
                        hintText: hintTextEmail),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      //check if this field is empty
                      if (value == null || value.isEmpty) {
                        return requieredString;
                      }
                      //usinf regular expresion
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return validEmailString;
                      }
                      //the email is valid
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 10),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelTextPassword,
                        hintText: hintTextPassword),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      //check if this field is empty
                      if (value == null || value.isEmpty) {
                        return requieredString;
                      }
                      //the email is valid
                      return null;
                    },
                  ),
                ),
                Container(
                  //padding:const EdgeInsets.only(top: 60.0),
                  // margin:
                  height: 50,
                  width: 250,

                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20)),

                  child: ElevatedButton(
                    child: Text(
                      widget.buttonTitle,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () {
                      _saveFormEmail();
                      Text("Check Email");
                      const SizedBox(height: 25);
                      _isValidEmail & _isValidPassword
                          ? Navigator.pushNamed(
                              context,
                              SignUpScreen.routeName,
                            )
                          : Container();
                    },
                  ),
                ),
                Container(
                  child: TextButton(
                      child: Text(signupString),
                    onPressed:() => Navigator.pushNamed(
                      context,
                      SignUpScreen.routeName,
                    ) ,
                  )
                ),
              ],
            )),
      ),
    );
  }
}
/*
class _LogInorSignUpViewState extends State<CredentialsView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.screenTitle,
            style: const TextStyle(
                fontSize: titleFontSize,
                color: Colors.black,
                fontWeight: FontWeight.w500))
      ],
    );

  }
}*/
