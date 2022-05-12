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
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}