import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:base_auth/components/common/field.dart';

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
  final _phoneController = MaskedTextController(
      text: _form['phone'],
      mask: "+# (###) ###-##-##",
      translator: {"#": RegExp(r'[0-9]')});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _loginValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(4, errorText: 'Длинна логина не менее 4 символов'),
  ]);

  final _emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    EmailValidator(errorText: 'Введите корректный email'),
  ]);

  final _phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(18, errorText: 'Допишите номер'),
  ]);

  final _pwdDoubleValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    EqualValidator(other: () => _form['pwd'], errorText: 'Пароли не совпадают'),
  ]);

  final _pwdValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(8, errorText: 'Длинна пароля не менее 8 символов'),
    PatternValidator(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!-_()@#\$&*~])',
        errorText: 'Пароль должен иметь символ,цифру и заглавную букву')
  ]);

  void _loginChange(val) => setState(() => _form['login'] = val);

  void _emailChange(val) => setState(() => _form['email'] = val);

  void _phoneChange(val) => setState(() => _form['phone'] = val);

  void _pwdChange(val) => setState(() => _form['pwd'] = val);

  void _pwdDoubleChange(val) => setState(() => _form['pwdDouble'] = val);

  void _login() {
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
                      onValidate: _loginValidator,
                      label: 'Логин',
                      onInput: _loginChange,
                    ),
                    Field(
                      onValidate: _emailValidator,
                      label: 'Элетронная почта',
                      onInput: _emailChange,
                      type: TextInputType.emailAddress,
                    ),
                    Field(
                      controller: _phoneController,
                      onValidate: _phoneValidator,
                      label: 'Номер телефона',
                      onInput: _phoneChange,
                      type: TextInputType.phone,
                    ),
                    Field(
                      isPwd: true,
                      onValidate: _pwdValidator,
                      label: 'Пароль',
                      onInput: _pwdChange,
                    ),
                    Field(
                      isEnabled: _form['pwd'].isNotEmpty,
                      isPwd: true,
                      onValidate: _pwdDoubleValidator,
                      label: 'Подтвердите пароль',
                      onInput: _pwdDoubleChange,
                    ),
                  ])),
              RaisedButton(
                  color: Colors.blue,
                  onPressed: _login,
                  child: Text('Создать'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ))),
            ])),
      );
}

class EqualValidator extends TextFieldValidator {
  EqualValidator({String errorText = 'Not equal', this.other})
      : assert(other != null),
        super(errorText);

  String Function() other;

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String val) => val.trim() == other().trim();
}
