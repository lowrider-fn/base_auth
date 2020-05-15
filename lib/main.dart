import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:base_auth/views/login.dart';
import 'package:base_auth/views/register.dart';
import 'package:base_auth/views/profile.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isLogin = false;
  dynamic _userData;

  @override
  void initState() {
    super.initState();
    _autoLogIn();
  }

  bool _isLandscape(context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  Future<void> _autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userData = prefs.getString('userData');

    print(userData);
    if (userData != null) {
      setState(() {
        _isLogin = true;
        _userData = userData;
      });
    }
  }

  Future<Null> _loginUser(form) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(form));

    setState(() {
      _userData = form;
      _isLogin = true;
    });
  }

  Future<Null> _createAccount(form) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(form));

    setState(() {
      _userData = form;
      _isLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Base auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => !_isLogin
            ? Profile()
            : Login(toLogin: _loginUser, isLandscape: _isLandscape(context)),
        '/profile': (context) => Profile(),
        '/registration': (context) => Register(
            toRegister: _createAccount, isLandscape: _isLandscape(context)),
      },
    );
  }
}
