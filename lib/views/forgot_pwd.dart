import 'package:flutter/material.dart';

import 'package:base_auth/plugins/mask.dart';
import 'package:base_auth/plugins/validator.dart';

import 'package:base_auth/components/common/view.dart';
import 'package:base_auth/components/common/field.dart';
import 'package:base_auth/components/common/btn.dart';
import 'package:base_auth/components/common/text_box.dart';

class ForgotPwd extends StatefulWidget {
  const ForgotPwd({
    this.onFormCompleated,
    this.isLandscape,
    Key key,
  })  : assert(onFormCompleated != null),
        assert(isLandscape != null),
        super(key: key);

  final bool isLandscape;
  final Function onFormCompleated;

  @override
  _ForgotPwdState createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  final Map<String, String> _form = {'phone': '', 'login': ''};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _phoneChange(val) => setState(() => _form['phone'] = val);

  void _loginChange(val) => setState(() => _form['login'] = val);

  void _checkForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onFormCompleated(_form);
      Navigator.pushNamed(context, '/update');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Востановление пароль'),
      ),
      body: Center(
          child: View(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              alignX: CrossAxisAlignment.center,
              children: [
            TextBox(
                text: 'Востановить пароль',
                margin: EdgeInsets.only(bottom: 20),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                )),
            Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                      margin: new EdgeInsets.only(bottom: 10),
                      child: Column(children: [
                        Field(
                          onValidate: Validator.login,
                          label: 'Логин',
                          onInput: _loginChange,
                        ),
                        Field(
                          controller: Mask.phone(_form['phone']),
                          onValidate: Validator.phone,
                          label: 'Номер телефона',
                          onInput: _phoneChange,
                          type: TextInputType.phone,
                        ),
                      ])),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Btn(
                          color: Colors.redAccent,
                          text: 'Я передумал',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Btn(
                          text: 'Отправить код',
                          onPressed: _checkForm,
                        )
                      ])
                ])),
          ])));
}
