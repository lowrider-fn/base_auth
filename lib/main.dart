import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:base_auth/views/auth/auth.dart';

import 'package:base_auth/views/profile/profile.dart';
import 'package:base_auth/store/models/user_model.dart';

void main() => runApp(App(model: UserModel()));

class App extends StatelessWidget {
  App({@required this.model}) : assert(model != null);

  final UserModel model;

  Route<dynamic> generateRoute(RouteSettings settings) {
    model.autoLogin();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => ScopedModelDescendant<UserModel>(
                builder: (context, child, model) => model.isLogin
                    ? Profile(model: model)
                    : Auth(model: model)));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  @override
  Widget build(BuildContext context) => ScopedModel<UserModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: generateRoute,
      ));
}
