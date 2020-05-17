import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:base_auth/views/auth/auth.dart';

import 'package:base_auth/views/profile/profile.dart';
import 'package:base_auth/store/models/user_model.dart';
import 'package:base_auth/store/root.dart';

void main() => runApp(App(store: RootStore()));

class App extends StatelessWidget {
  App({@required this.store}) : assert(store != null);

  final RootStore store;

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) =>
      MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => builder,
      );

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => ScopedModelDescendant<UserModel>(
                builder: (context, child, model) => model.isLogin
                    ? Profile(model: model)
                    : Auth(model: model)));
      default:
        return _buildRoute(
            settings,
            Scaffold(
              body: Center(child: Text('Экран ${settings.name} не найден')),
            ));
    }
  }

  @override
  Widget build(BuildContext context) {
    store.user.autoLogin();
    return ScopedModel<UserModel>(
        model: store.user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Base auth',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          onGenerateRoute: generateRoute,
        ));
  }
}
