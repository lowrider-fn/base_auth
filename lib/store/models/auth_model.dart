import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

mixin AuthModel on Model {
  bool _isLogin = false;
  dynamic _userData;
  bool get isLogin => _isLogin;
  dynamic get userData => _userData;

  Future<void> autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userData = prefs.getString('userData');

    if (userData != null) {
      _isLogin = true;
      _userData = userData;
    }
    notifyListeners();
  }

  Future<Null> login(form) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(form));
    print(form);

    _userData = form;
    _isLogin = true;
    notifyListeners();
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', null);

    _isLogin = false;
    _userData = null;
    notifyListeners();
  }

  Future<Null> createAccount(form) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(form));

    _userData = form;
    _isLogin = true;
    notifyListeners();
  }

  restorePwd(form) {
    print(form);
    notifyListeners();
  }

  updatePwd(form) {
    print(form);
    _isLogin = true;
    notifyListeners();
  }
}
