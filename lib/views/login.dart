import 'package:flutter/material.dart';

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

  final Function toLogin;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: Center(
          child: Container(
              width: isLandscape ? 450 : null,
              child: SingleChildScrollView(
                  padding:
                      EdgeInsets.only(top: 80, bottom: 80, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextBox(
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                          text: 'Войдите в личный кабинет',
                          margin: EdgeInsets.only(bottom: 30)),
                      LoginForm(toLogin: toLogin),
                      LoginBottomActions(
                        toRegister: () =>
                            Navigator.pushNamed(context, '/registration'),
                        toRestorePwd: () => print('getpwd'),
                      )
                    ],
                  )))));
}
