import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({
    this.width = 450,
    this.padding,
    this.alignY = MainAxisAlignment.start,
    this.children,
    this.alignX,
    Key key,
  })  : assert(padding != null),
        assert(alignX != null),
        assert(alignY != null),
        assert(children != null),
        super(key: key);

  final double width;
  final EdgeInsets padding;
  final CrossAxisAlignment alignX;
  final MainAxisAlignment alignY;
  final List<Widget> children;

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
