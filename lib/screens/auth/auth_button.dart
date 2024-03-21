import 'package:flutter/material.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.authFunction,
      required this.textbtn,
      this.color = Colors.green});
  final Function authFunction;
  final String textbtn;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          authFunction();
        },
        child: TextWidget(
          text: textbtn,
          fontsize: 18,
          color: color,
        ),
      ),
    );
  }
}
