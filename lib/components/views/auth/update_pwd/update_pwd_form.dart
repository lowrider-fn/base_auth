import 'package:flutter/material.dart';

import 'package:base_auth/plugins/mask.dart';
import 'package:base_auth/plugins/validator.dart';

import 'package:base_auth/components/common/field.dart';
import 'package:base_auth/components/common/btn.dart';

class UpdatePwdForm extends StatefulWidget {
  const UpdatePwdForm({
    @required this.onFormCompleated,
    Key key,
  })  : assert(onFormCompleated != null),
        super(key: key);

  final onFormCompleated;

  @override
  _UpdatePwdFormState createState() => _UpdatePwdFormState();
}

class _UpdatePwdFormState extends State<UpdatePwdForm> {
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
      _close();
    }
  }

  void _codeChange(val) => setState(() => _form['code'] = val);

  void _pwdChange(val) => setState(() => _form['pwd'] = val);

  void _pwdDoubleChange(val) => setState(() => _form['pwdDouble'] = val);

  void _close() => Navigator.pushNamed(context, '/');

  @override
  Widget build(BuildContext context) => Form(
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      ]));
}
