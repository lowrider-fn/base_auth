import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:base_auth/views/auth/views/login.dart';
import 'package:base_auth/views/auth/views/register.dart';
import 'package:base_auth/views/auth/views/forgot_pwd.dart';
import 'package:base_auth/views/auth/views/update_pwd.dart';

import 'package:base_auth/store/models/auth_model.dart';

class Auth extends StatelessWidget {
  Auth({@required this.model}) : assert(model != null);

  final AuthModel model;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScopedModel<AuthModel>(
        model: model,
        child: MaterialApp(initialRoute: '/', routes: {
          '/': (context) =>
              Login(toLogin: model.login, isLandscape: isLandscape),
          '/registration': (context) => Register(
              onFormCompleated: model.createAccount, isLandscape: isLandscape),
          '/forgot': (context) => ForgotPwd(
              onFormCompleated: model.restorePwd, isLandscape: isLandscape),
          '/update': (context) => UpdatePwd(
              onFormCompleated: model.updatePwd, isLandscape: isLandscape),
        }));
  }
}
