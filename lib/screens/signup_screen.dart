
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers-constants/constants.dart';
import '../helpers-constants/strings.dart';
import '../views/credentials_view.dart';

class SignUpScreen extends StatelessWidget{

  static const routeName = 'signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: intermediateSpace),
            child: CredentialsView(
              screenTitle: signupString,
              buttonTitle: signupButtonTitle,
              appBarTitle: appBarSignUpTitle,
            ),
          ),
        ),
      ),
    );
  }

}