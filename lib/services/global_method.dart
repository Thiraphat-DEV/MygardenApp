import 'package:flutter/material.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  // function logout with show warning dialog before user logout
  static Future<void> warningDialogMethod(
      {required String title,
      required String subtitle,
      required Function fct,
      required BuildContext context}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: <Widget>[
              Image.asset(
                'assets/images/warning_logout.jpg',
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 10,
              ),
               Text(title),
            ]),
            content:  Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: TextWidget(
                    color: Colors.yellow.shade900,
                    text: 'ยกเลิก',
                    fontsize: 18,
                  )),
              TextButton(
                  onPressed: () {
                    fct();
                  },
                  child: TextWidget(
                    color: Colors.redAccent,
                    text: 'ยืนยัน',
                    fontsize: 18,
                  )),
            ],
          );
        });
  }
}
