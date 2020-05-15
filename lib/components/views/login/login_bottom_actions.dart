import 'package:flutter/material.dart';

import 'package:base_auth/components/common/text_box.dart';
import 'package:base_auth/components/common/btn_underline.dart';

class LoginBottomActions extends StatelessWidget {
  LoginBottomActions({
    this.toRegister,
    this.toRestorePwd,
    Key key,
  })  : assert(toRegister != null && toRestorePwd != null),
        super(key: key);

  final Function toRegister;
  final Function toRestorePwd;

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextBox(
              text: 'Еще нет аккаунта?', margin: EdgeInsets.only(bottom: 10)),
          BtnUnderline(text: 'Зарегистрироваться', onTap: toRegister),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextBox(text: 'Забыли пароль?', margin: EdgeInsets.only(bottom: 10)),
          BtnUnderline(text: 'Восстановить', onTap: toRestorePwd),
        ]),
      ]);
}
