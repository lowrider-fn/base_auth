import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({
    this.width = 450,
    @required this.padding,
    this.alignY = MainAxisAlignment.start,
    @required this.children,
    @required this.alignX,
    Key key,
  })  : assert(padding != null),
        assert(alignX != null),
        assert(alignY != null),
        assert(children != null),
        super(key: key);

  final CrossAxisAlignment alignX;
  final MainAxisAlignment alignY;
  final List<Widget> children;
  final EdgeInsets padding;
  final double width;

  @override
  Widget build(BuildContext context) => Container(
      width: width,
      child: SingleChildScrollView(
          padding: padding,
          child: Column(
              mainAxisAlignment: alignY,
              crossAxisAlignment: alignX,
              children: children)));
}
