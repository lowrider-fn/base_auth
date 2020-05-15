import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class BtnUnderline extends StatelessWidget {
  BtnUnderline({
    Key key,
    this.text,
    this.color = Colors.blue,
    this.onTap,
    this.textStyle,
  })  : assert(text != null),
        super(key: key);

  final String text;
  final Color color;
  final TextStyle textStyle;
  final Function onTap;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          dashPattern: [4, 2],
          color: color,
          customPath: (size) => Path()
            ..moveTo(0, 20)
            ..lineTo(size.width, 20),
          child: Text(text,
              style: textStyle ??
                  TextStyle(color: color, fontWeight: FontWeight.w500)),
        ),
      );
}
