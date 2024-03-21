import 'package:flutter/material.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlue,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white12,
              child: Image.asset('assets/images/google.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            TextWidget(
                text: "เข้าสู่ระบบด้วย Google",
                color: Colors.white,
                fontsize: 18),
          ],
        ),
      ),
    );
  }
}
