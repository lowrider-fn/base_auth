import 'package:flutter/material.dart';

import 'package:base_auth/components/common/view.dart';

class Popup extends StatelessWidget {
  const Popup({
    @required this.children,
    Key key,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Center(
      child: Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(20),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          child: View(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              alignX: CrossAxisAlignment.center,
              children: children)));
}
