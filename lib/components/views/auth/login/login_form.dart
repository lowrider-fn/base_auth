import 'package:flutter/material.dart';

import 'package:base_auth/plugins/validator.dart';

import 'package:base_auth/components/common/field.dart';
import 'package:base_auth/components/common/btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    @required this.onFormCompleated,
    Key key,
  })  : assert(onFormCompleated != null),
        super(key: key);

  final onFormCompleated;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final Map<String, String> _form = {'pwd': '', 'login': ''};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _loginChange(val) => setState(() => _form['login'] = val);

  void _pwdChange(val) => setState(() => _form['pwd'] = val);

  void _checkForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onFormCompleated(_form);
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
                      isPwd: true,
                      onValidate: Validator.pwd,
                      label: 'Пароль',
                      onInput: _pwdChange,
                    ),
                  ])),
              Btn(
                text: 'Войти',
                color: Colors.green,
                onPressed: _checkForm,
              )
            ])),
      );
}
