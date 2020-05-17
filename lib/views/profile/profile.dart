import 'package:flutter/material.dart';
import 'package:base_auth/store/models/auth_model.dart';
import 'package:base_auth/components/common/view.dart';
import 'package:scoped_model/scoped_model.dart';

class Profile extends StatelessWidget {
  Profile({Key key, this.model})
      : assert(model != null),
        super(key: key);

  final AuthModel model;
  static List<BottomNavigationBarItem> navigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      title: Text(
        "Профиль",
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.web, // event_note
      ),
      title: Text(
        "Лента",
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings, // grid_on
      ),
      title: Text(
        "Настройки",
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ScopedModel<AuthModel>(
        model: model,
        child: MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: Text('Профиль'),
            actions: [
              IconButton(onPressed: model.logout, icon: Icon(Icons.exit_to_app))
            ],
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white, backgroundColor: Colors.blue,
            unselectedItemColor: Colors.black,
            items: navigationBarItems,
            // onTap: _onTap,
          ),
        )));
  }
}
