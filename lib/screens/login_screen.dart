import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/screens/signup_screen.dart';

import '../helpers-constants/constants.dart';
import '../helpers-constants/strings.dart';
import '../views/credentials_view.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = 'login';

  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: intermediateSpace),
                child: CredentialsView(
                  screenTitle: loginString,
                  buttonTitle: loginButtonTitle,
                  appBarTitle: appBarLogInTitle,
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: intermediateSpace),
                child: TextButton(
                  child: Text(signupString),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    SignUpScreen.routeName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
