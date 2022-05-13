import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers-constants/constants.dart';
import '../helpers-constants/strings.dart';

class CredentialsView extends StatefulWidget {
  final String screenTitle;
  final String buttonTitle;
  final bool isSignUpScreen;
  late final Color _textColor;

  CredentialsView({
    Key? key,
    required this.screenTitle,
    required this.buttonTitle,
    this.isSignUpScreen = false,
  }) : super (key: key) {
    _textColor =
    (isSignUpScreen ? Colors.deepOrangeAccent[700] : Colors.black)!;
  }
  @override
  //_LogInorSignUpViewState createState() => _LogInorSignUpViewState();
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<CredentialsView>{
  final _form = GlobalKey<FormState>();
  bool _isValidEmail = false;
  bool _isValidPassword = false;

  void _saveFormEmail(){
    setState(() {
      _isValidEmail = _form.currentState!.validate();
      _isValidPassword = _form.currentState!.validate();
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"), //widget.title
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
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      //check if this field is empty
                      if(value == null || value.isEmpty){
                        return "This field is requiered";
                      }
                      //usinf regular expresion
                      if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                        return "Please enter a valid email adress";
                      }
                      //the email is valid
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                      //check if this field is empty
                      if(value == null || value.isEmpty){
                        return "This field is requiered";
                      }
                      //the email is valid
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      _saveFormEmail(); child: Text("Check Email");
                      const SizedBox(height: 25);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            )
        ),
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
