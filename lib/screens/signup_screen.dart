import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers-constants/strings.dart';
import '../managers/authentication_manager.dart';
import 'currency_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  String _firstName = "";
  String _secondName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarSignUpTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 25.0, right: 25.0, top: 30, bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "First name",
                    hintText: "ex: Valeria"),
                keyboardType: TextInputType.name,
                onChanged: (newValue) {
                  _firstName = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Second name",
                    hintText: "ex: Rus"),
                keyboardType: TextInputType.name,
                onChanged: (newValue) {
                  _secondName = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "ex: valeria@abc.com"),
                keyboardType: TextInputType.emailAddress,
                onChanged: (newValue) {
                  _email = newValue;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Set a strong password"),
                keyboardType: TextInputType.visiblePassword,
                onChanged: (newValue) {
                  _password = newValue;
                },
              ),
            ),
            Container(
              height: 50,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  // Background color
                  primary: Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  context.read<AuthenticationManager>().SignUpUser(
                    email: _email,
                    password: _password,
                  );
               /*   Navigator.pushNamed(
                    context,
                    CurrencyScreen.routeName,
                    //SignUpScreen.routeName,
                  );*/
                  /*
                  bool isValid = validateFields();
                  if (isValid) {
                    Navigator.pushNamed(
                      context,
                      CurrencyScreen.routeName,
                      //SignUpScreen.routeName,
                    );
                  } */
                },
                child: Text('Sign in', style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  void authenticateUser() {
    AuthenticationManager _authenticationManager = AuthenticationManager();
    _authenticationManager.singUpUser(_email, _password);
  }

  bool validateFields() {
    if (_email.isNotEmpty &&
        _password.isNotEmpty &&
        _secondName.isNotEmpty &&
        _firstName.isNotEmpty) {
      authenticateUser();
      return true;
    } else {
      SnackBar initSnackbar = const SnackBar(
        content: const Text("All field are mandatory"),
      );
      ScaffoldMessenger.of(context).showSnackBar(initSnackbar);
    }
    return false;
  }

   */
}
