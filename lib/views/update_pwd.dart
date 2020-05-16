import 'package:flutter/material.dart';

import 'package:base_auth/plugins/mask.dart';
import 'package:base_auth/plugins/validator.dart';

import 'package:base_auth/components/common/view.dart';
import 'package:base_auth/components/common/field.dart';
import 'package:base_auth/components/common/btn.dart';
import 'package:base_auth/components/common/text_box.dart';

class UpdatePwd extends StatefulWidget {
  const UpdatePwd({
    this.onFormCompleated,
    this.isLandscape,
    Key key,
  })  : assert(onFormCompleated != null),
        assert(isLandscape != null),
        super(key: key);

  final bool isLandscape;
  final Function onFormCompleated;

  @override
  _UpdatePwdState createState() => _UpdatePwdState();
}

class _UpdatePwdState extends State<UpdatePwd> {
  final Map<String, String> _form = {
    'pwd': '',
    'code': '',
    'pwdDouble': '',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _checkForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onFormCompleated(_form);
      Navigator.pushNamed(context, '/');
    }
  }

  void _codeChange(val) => setState(() => _form['code'] = val);

  void _pwdChange(val) => setState(() => _form['pwd'] = val);

  void _pwdDoubleChange(val) => setState(() => _form['pwdDouble'] = val);

  void _close() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Обновление пароля'),
      ),
      body: Center(
          child: View(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              alignX: CrossAxisAlignment.center,
              children: [
            TextBox(
                text: 'Обновить пароль',
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
                          isPwd: true,
                          onValidate: Validator.pwd,
                          label: 'Пароль',
                          onInput: _pwdChange,
                        ),
                        Field(
                          isEnabled: _form['pwd'].isNotEmpty,
                          isPwd: true,
                          onValidate: Validator.pwdDouble(_form['pwd']),
                          label: 'Подтвердите пароль',
                          onInput: _pwdDoubleChange,
                        ),
                        Field(
                          controller: Mask.code(_form['code']),
                          onValidate: Validator.code,
                          label: 'Смс код',
                          onInput: _codeChange,
                          type: TextInputType.number,
                        ),
                      ])),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Btn(
                          color: Colors.redAccent,
                          text: 'Я передумал',
                          onPressed: _close,
                        ),
                        Btn(
                          text: 'Обновить',
                          onPressed: _checkForm,
                        )
                      ])
                ])),
          ])));
}
