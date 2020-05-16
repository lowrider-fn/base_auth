import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  static final login = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(4, errorText: 'Длинна логина не менее 4 символов'),
  ]);

  static final email = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    EmailValidator(errorText: 'Введите корректный email'),
  ]);

  static final phone = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(18, errorText: 'Допишите номер'),
  ]);

  static MultiValidator pwdDouble(String val) => MultiValidator([
        RequiredValidator(errorText: 'Заполните поле'),
        EqualValidator(other: val, errorText: 'Пароли не совпадают'),
      ]);

  static final pwd = MultiValidator([
    RequiredValidator(errorText: 'Заполните поле'),
    MinLengthValidator(8, errorText: 'Длинна пароля не менее 8 символов'),
    PatternValidator(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!-_()@#\$&*~])',
        errorText: 'Пароль должен иметь символ,цифру и заглавную букву')
  ]);
}

class EqualValidator extends TextFieldValidator {
  EqualValidator({String errorText = 'Not equal', this.other})
      : assert(other != null),
        super(errorText);

  String other;

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String val) => val.trim() == other.trim();
}
