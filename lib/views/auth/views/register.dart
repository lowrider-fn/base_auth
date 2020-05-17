import 'package:flutter/material.dart';

import 'package:base_auth/components/common/view.dart';
import 'package:base_auth/components/common/text_box.dart';
import 'package:base_auth/components/views/auth/register/register_form.dart';
import 'package:base_auth/components/common/btn_underline.dart';
import 'package:base_auth/components/common/head_text.dart';

class Register extends StatelessWidget {
  Register(
      {Key key, @required this.isLandscape, @required this.onFormCompleated})
      : assert(onFormCompleated != null && isLandscape != null),
        super(key: key);

  final Function onFormCompleated;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Center(
          child: View(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              alignX: CrossAxisAlignment.center,
              children: [
            HeadText(text: 'Создать аккаунт'),
            Text('Регистрация занимает 30 секунд.',
                style: TextStyle(fontSize: 16)),
            Text('После регистрации вы получите',
                style: TextStyle(fontSize: 16)),
            TextBox(
                margin: EdgeInsets.only(bottom: 20),
                text: '7 дней бесплатного доступа',
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.green)),
            RegisterForm(onFormCompleated: onFormCompleated),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBox(
                      text: 'Уже есть аккаунт?',
                      margin: EdgeInsets.only(bottom: 10)),
                  BtnUnderline(
                      color: Colors.green,
                      text: 'Войти В Личный Кабинет',
                      onTap: () => Navigator.pop(context)),
                ]),
          ])));
}
