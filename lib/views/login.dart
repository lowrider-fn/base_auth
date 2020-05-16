import 'package:flutter/material.dart';

import 'package:base_auth/components/common/view.dart';
import 'package:base_auth/components/common/text_box.dart';
import 'package:base_auth/components/views/login/login_form.dart';
import 'package:base_auth/components/views/login/login_bottom_actions.dart';

class Login extends StatelessWidget {
  const Login({
    this.toLogin,
    this.isLandscape,
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
          TextBox(
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              text: 'Войдите в личный кабинет',
              margin: EdgeInsets.only(bottom: 30)),
          LoginForm(toLogin: toLogin),
          LoginBottomActions(
            toRegister: () => Navigator.pushNamed(context, '/registration'),
            toRestorePwd: () => Navigator.pushNamed(context, '/forgot'),
          )
        ],
      )));
}
