import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextBox({
    Key key,
    @required this.text,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.textStyle,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => Container(
      padding: padding, margin: margin, child: Text(text, style: textStyle));
}
