import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontsize,
      this.title = false,
      this.maxLines = 100})
      : super(key: key);
  final String text;
  final Color color;
  final double fontsize;
  bool title;
  int maxLines = 100;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: fontsize,
          fontWeight: title ? FontWeight.bold : FontWeight.normal),
    );
  }
}
