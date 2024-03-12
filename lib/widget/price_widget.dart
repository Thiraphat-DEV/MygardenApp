import 'package:flutter/material.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isSale})
      : super(key: key);
  final double salePrice, price;
  final String textPrice;
  final bool isSale;
  @override
  Widget build(BuildContext context) {
    double userPrice = isSale ? salePrice : price;
    Color color = GlobalUtils(context).color;
    return FittedBox(
      child: Row(children: [
        TextWidget(text: "฿${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}", color: Colors.yellow, fontsize: 16),
        const SizedBox(
          width: 5,
        ),
        Visibility(
          visible: isSale ? true : false,
          child: Text(
            "฿${(price * int.parse(textPrice)).toStringAsFixed(2)}",
            style: TextStyle(
                fontSize: 15,
                color: color,
                decoration: TextDecoration.lineThrough),
          ),
        )
      ]),
    );
  }
}
