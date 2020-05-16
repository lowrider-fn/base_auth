import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  Btn({
    Key key,
    this.text,
    this.color = Colors.blue,
    this.onPressed,
    this.textStyle,
  })  : assert(text != null),
        super(key: key);

  final Color color;
  final Function onPressed;
  final String text;
  final TextStyle textStyle;

  TextStyle get styles => textStyle != null
      ? textStyle
      : TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.white,
        );

  @override
  Widget build(BuildContext context) => RaisedButton(
      color: color,
      onPressed: onPressed,
      child: Text(text.toUpperCase(), style: styles));
}
