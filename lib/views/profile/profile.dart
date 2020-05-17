import 'package:flutter/material.dart';
import 'package:base_auth/store/models/user_model.dart';
import 'package:base_auth/components/common/view.dart';
import 'package:scoped_model/scoped_model.dart';

class Profile extends StatelessWidget {
  Profile({Key key, this.model})
      : assert(model != null),
        super(key: key);

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScopedModel<UserModel>(
        model: model,
        child: MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: Text('Профиль'),
            elevation: 0.0,
            leading: IconButton(
                onPressed: model.logout, icon: Icon(Icons.exit_to_app)),
          ),
          body: Center(
            child: View(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
              alignX: CrossAxisAlignment.center,
              children: [
                Text('Профиль'),
              ],
            ),
          ),
        )));
  }
}
// onGenerateRoute: generateRoute,

// Route<dynamic> generateRoute(RouteSettings settings) {
//   model.autoLogin();

//   switch (settings.name) {
//     case '/':
//       return MaterialPageRoute(
//           builder: (_) => ScopedModelDescendant<UserModel>(
//               builder: (context, child, model) => model.isLogin
//                   ? Profile(model: model)
//                   : Auth(model: model)));
//     default:
//       return MaterialPageRoute(
//           builder: (_) => Scaffold(
//                 body: Center(
//                     child: Text('No route defined for ${settings.name}')),
//               ));
//   }
// }
