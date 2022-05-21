
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/helpers-constants/strings.dart';
import 'package:flutter_project2/screens/signup_screen.dart';

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

  void _saveFormEmail(){
    setState(() {
      _isValidEmail = _form.currentState!.validate();
      _isValidPassword = _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appBarLogInTitle), //widget.title
      ),

      body: SingleChildScrollView(
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
                      if(value == null || value.isEmpty){
                        return requieredString;
                      }
                      //usinf regular expresion
                      if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                        return validEmailString;
                      }
                      //the email is valid
                      return null;
                    },
                  ),
                ),
                Padding(
                 // padding: //const EdgeInsets.only(
                     // left: 15.0, right: 15.0, top: 15, bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelTextPassword,
                        hintText: hintTextPassword),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value){
                      //check if this field is empty
                      if(value == null || value.isEmpty){
                        return requieredString;
                      }
                      //the email is valid
                      return null;
                    },
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
                      _saveFormEmail();
                      const SizedBox(height: 25);
                      Navigator.pushNamed(
                          context,
                          SignUpScreen.routeName,
                      );
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
      ),
    );
  }
}