import 'package:flutter/material.dart';

import 'package:base_auth/plugins/mask.dart';
import 'package:base_auth/plugins/validator.dart';

import 'package:base_auth/components/common/field.dart';
import 'package:base_auth/components/common/btn.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    this.toRegister,
    Key key,
  })  : assert(toRegister != null),
        super(key: key);

  final toRegister;

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  static final Map<String, String> _form = {
    'pwd': '',
    'login': '',
    'pwdDouble': '',
    'phone': '',
    'email': ''
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _loginChange(val) => setState(() => _form['login'] = val);

  void _emailChange(val) => setState(() => _form['email'] = val);

  void _phoneChange(val) => setState(() => _form['phone'] = val);

  void _pwdChange(val) => setState(() => _form['pwd'] = val);

  void _pwdDoubleChange(val) => setState(() => _form['pwdDouble'] = val);

  void _checkForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.toRegister(_form);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
      margin: new EdgeInsets.only(bottom: 50),
      child: Form(
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
                    onValidate: Validator.email,
                    label: 'Элетронная почта',
                    onInput: _emailChange,
                    type: TextInputType.emailAddress,
                  ),
                  Field(
                    controller: Mask.phone(_form['phone']),
                    onValidate: Validator.phone,
                    label: 'Номер телефона',
                    onInput: _phoneChange,
                    type: TextInputType.phone,
                  ),
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
                ])),
            Btn(
              text: 'Создать',
              onPressed: _checkForm,
            )
          ])));
}
