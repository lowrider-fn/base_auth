import 'package:flutter/material.dart';

import 'package:base_auth/plugins/mask.dart';
import 'package:base_auth/plugins/validator.dart';

import 'package:base_auth/components/common/field.dart';
import 'package:base_auth/components/common/btn.dart';

class ForgotPwdForm extends StatefulWidget {
  const ForgotPwdForm({
    @required this.onFormCompleated,
    Key key,
  })  : assert(onFormCompleated != null),
        super(key: key);

  final onFormCompleated;

  @override
  _ForgotPwdFormState createState() => _ForgotPwdFormState();
}

class _ForgotPwdFormState extends State<ForgotPwdForm> {
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
                      controller: Mask.phone(_form['phone']),
                      onValidate: Validator.phone,
                      label: 'Номер телефона',
                      onInput: _phoneChange,
                      type: TextInputType.phone,
                    ),
                  ])),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      );
}
