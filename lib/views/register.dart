import 'package:flutter/material.dart';

import 'package:base_auth/components/common/text_box.dart';
import 'package:base_auth/components/views/register/register_form.dart';
import 'package:base_auth/components/common/btn_underline.dart';

class Register extends StatelessWidget {
  Register({Key key, this.isLandscape, this.toRegister})
      : assert(toRegister != null && isLandscape != null),
        super(key: key);

  final Function toRegister;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
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
                            text: 'Создать аккаунт',
                            margin: EdgeInsets.only(bottom: 10)),
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
                        RegisterForm(toRegister: toRegister),
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
                      ])))));
}
