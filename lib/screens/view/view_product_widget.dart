import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class ViewProductWidget extends StatefulWidget {
  const ViewProductWidget({super.key});

  @override
  State<ViewProductWidget> createState() => _ViewProductWidgetState();
}

class _ViewProductWidgetState extends State<ViewProductWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    Size size = GlobalUtils(context).screenSize;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              context: context, routeName: InsideProductDetail.routeName);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FancyShimmerImage(
              imageUrl: "https://via.placeholder.com/50x50",
              width: size.width * 0.70,
              height: size.width * 0.70,
              // boxFit: BoxFit.fill,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              children: [
                TextWidget(
                  text: "Product",
                  color: color,
                  fontsize: 24,
                  title: true,
                ),
                const SizedBox(
                  width: 12,
                ),
                TextWidget(text: "200 Baht", color: color, fontsize: 24),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.greenAccent,
                child: InkWell(
                  autofocus: true,
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      CupertinoIcons.add,
                      color: color,
                      size: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
