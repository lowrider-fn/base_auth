import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:base_auth/components/common/field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    this.toLogin,
    Key key,
  })  : assert(toLogin != null),
        super(key: key);

  final toLogin;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final Map<String, String> _form = {'pwd': '', 'login': ''};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _loginValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(4, errorText: 'Длинна логина не менее 4 символов'),
  ]);

  final _pwdValidator = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(8, errorText: 'Длинна пароля не менее 8 символов'),
    PatternValidator(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!-_()@#\$&*~])',
        errorText: 'Пароль должен иметь символ,цифру и заглавную букву')
  ]);

  void _loginChange(val) => setState(() => _form['login'] = val);

  void _pwdChange(val) => setState(() => _form['pwd'] = val);

  void _login() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.toLogin(_form);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: new EdgeInsets.only(bottom: 50),
        child: Form(
            key: _formKey,
            // autovalidate: true,
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
                      isPwd: true,
                      onValidate: _pwdValidator,
                      label: 'Пароль',
                      onInput: _pwdChange,
                    ),
                  ])),
              RaisedButton(
                  color: Colors.green,
                  onPressed: _login,
                  child: Text('Войти'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ))),
            ])),
      );
}
