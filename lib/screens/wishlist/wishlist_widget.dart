import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/heartbtn_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = GlobalUtils(context).screenSize;
    Color color = GlobalUtils(context).color;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              context: context, routeName: InsideProductDetail.routeName);
        },
        child: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.5),
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                width: size.width * 0.15,
                height: size.width * 0.20,
                child: FancyShimmerImage(
                  imageUrl: "https://via.placeholder.com/150x150",
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyBold.bag2,
                          color: color,
                        ),
                      ),
                      HeartBtnWidget(),
                    ],
                  ),
                  Flexible(
                    child: TextWidget(
                      text: "product title",
                      color: color,
                      fontsize: 18,
                      title: true,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: "200 ฿",
                    color: color,
                    fontsize: 14,
                    maxLines: 1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
