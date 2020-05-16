import 'package:flutter/material.dart';
import 'package:base_auth/views/login.dart';
import 'package:base_auth/views/forgot_pwd.dart';
import 'package:base_auth/views/register.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String register = '/register';
  static const String forgot = '/forgot';
}

class Auth extends StatefulWidget {
  const Auth({
    this.toLogin,
    this.toRestorePwd,
    this.onFormCompleated,
    Key key,
  })  : assert(toLogin != null),
        assert(toRestorePwd != null),
        assert(onFormCompleated != null),
        super(key: key);

  final Function toRestorePwd;
  final Function onFormCompleated;
  final Function toLogin;
  @override
  State<StatefulWidget> createState() => AuthState();
}

class AuthState extends State<Auth> {
  bool _isLandscape(context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
      TabNavigatorRoutes.root: (context) =>
          Login(toLogin: widget.toLogin, isLandscape: _isLandscape(context)),
      TabNavigatorRoutes.register: (context) => Register(
          onFormCompleated: widget.onFormCompleated,
          isLandscape: _isLandscape(context)),
      TabNavigatorRoutes.forgot: (context) => ForgotPwd(
          onFormCompleated: widget.onFormCompleated,
          isLandscape: _isLandscape(context)),
    };
  }

  @override
  Widget build(BuildContext context) => Navigator(
      // key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
          builder: (context) =>
              _routeBuilders(context)[routeSettings.name](context)));
  //   return WillPopScope(
  //     onWillPop: () async {
  //       final isFirstRouteInCurrentTab =
  //           !await _navigatorKeys[_currentTab].currentState.maybePop();
  //       if (isFirstRouteInCurrentTab) {
  //         // if not on the 'main' tab
  //         if (_currentTab != TabItem.red) {
  //           // select 'main' tab
  //           _selectTab(TabItem.red);
  //           // back button handled by app
  //           return false;
  //         }
  //       }
  //       // let system handle back button if we're on the first route
  //       return isFirstRouteInCurrentTab;
  //     },
  //     child: Scaffold(
  //       body: Stack(children: <Widget>[
  //         _buildOffstageNavigator(TabItem.red),
  //         _buildOffstageNavigator(TabItem.green),
  //         _buildOffstageNavigator(TabItem.blue),
  //       ]),
  //       bottomNavigationBar: BottomNavigation(
  //         currentTab: _currentTab,
  //         onSelectTab: _selectTab,
  //       ),
  //     ),
  //   );

  // Widget _buildOffstageNavigator(TabItem tabItem) {
  //   return Offstage(
  //     offstage: _currentTab != tabItem,
  //     child: TabNavigator(
  //       navigatorKey: _navigatorKeys[tabItem],
  //       tabItem: tabItem,
  //     ),
  //   );
  // }
}
