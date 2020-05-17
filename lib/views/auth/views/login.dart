import 'package:flutter/material.dart';

import 'package:base_auth/components/common/view.dart';
import 'package:base_auth/components/views/auth/login/login_form.dart';
import 'package:base_auth/components/views/auth/login/login_bottom_actions.dart';
import 'package:base_auth/components/common/head_text.dart';

class Login extends StatelessWidget {
  const Login({
    @required this.toLogin,
    @required this.isLandscape,
    Key key,
  })  : assert(toLogin != null),
        assert(isLandscape != null),
        super(key: key);

  final bool isLandscape;
  final Function toLogin;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: Center(
          child: View(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
        alignX: CrossAxisAlignment.center,
        children: [
          HeadText(text: 'Войдите в личный кабинет'),
          LoginForm(onFormCompleated: toLogin),
          LoginBottomActions()
        ],
      )));
}
