import 'package:flutter/material.dart';

import 'package:base_auth/components/common/view.dart';
import 'package:base_auth/components/common/head_text.dart';
import 'package:base_auth/components/views/auth/update_pwd/update_pwd_form.dart';

class UpdatePwd extends StatelessWidget {
  const UpdatePwd({
    @required this.onFormCompleated,
    @required this.isLandscape,
    Key key,
  })  : assert(onFormCompleated != null),
        assert(isLandscape != null),
        super(key: key);

  final bool isLandscape;
  final Function onFormCompleated;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Смена пароля пароля'),
      ),
      body: Center(
          child: View(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              alignX: CrossAxisAlignment.center,
              children: [
            HeadText(text: 'Обновить пароль'),
            UpdatePwdForm(onFormCompleated: onFormCompleated)
          ])));
}
