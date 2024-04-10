import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    Size size = GlobalUtils(context).screenSize;

    return ListTile(
      subtitle: Text('จ่ายเงิน: 2000 ฿'),
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: InsideProductDetail.routeName);
      },
      leading: FancyShimmerImage(
        imageUrl: "https://via.placeholder.com/50x50",
        width: size.width * 0.70,
        height: size.width * 0.70,
        // boxFit: BoxFit.fill,
      ),
      title: TextWidget(
        text: "สินค้า (12)",
        color: color,
        fontsize: 18,
      ),
      trailing: TextWidget(
        text: "12/01/2000",
        color: color,
        fontsize: 18,
      ),
    );
  }
}
