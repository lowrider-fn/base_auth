import 'package:flutter/material.dart';
import 'package:base_auth/components/common/text_box.dart';

class HeadText extends StatelessWidget {
  HeadText({
    Key key,
    @required this.text,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.only(bottom: 20),
  })  : assert(text != null),
        super(key: key);

  final String text;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) => TextBox(
      text: text,
      margin: margin,
      padding: padding,
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ));
}
