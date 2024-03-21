import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/inside_screen/inside_feed_screen.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.subtitle,
      required this.buttonText});
  final String imgPath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    Size size = GlobalUtils(context).screenSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imgPath,
                  width: double.infinity,
                  height: size.height * 0.3,
                ),
                const SizedBox(
                  height: 10,
                ),
               Text(
                  title,
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                    text: subtitle,
                    color: color,
                    fontsize: 20),
                SizedBox(
                  height: size.height * 0.2,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: color,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                    ),
                    onPressed: () {
                      // back to feed of Products
                      GlobalMethods.navigateTo(
                          context: context,
                          routeName: InsideFeedScreen.routeName);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(IconlyBold.arrowLeftCircle),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(
                          text: buttonText,
                          fontsize: 20,
                          title: true,
                          color: color,
                        ),
                      ],
                    )),
              ]),
        ),
      ),
    );
  }
}
