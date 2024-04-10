import 'package:flutter/material.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

// ignore: must_be_immutable
class EmptyProductWidget extends StatelessWidget {
  const EmptyProductWidget({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('assets/images/emptybox.jpg',
              height: 300, width: 700, fit: BoxFit.fill),
        ),
        Center(
          child: TextWidget(
            text: text,
            fontsize: 30,
            color: color,
            title: true,
          ),
        )
      ],
    );
  }
}
