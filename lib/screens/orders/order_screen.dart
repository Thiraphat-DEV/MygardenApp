import 'package:flutter/material.dart';
import 'package:mygardenapp/screens/orders/order_widget.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/background_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    return Scaffold(
      appBar: AppBar(
        leading: BackgroundWidget(),
        elevation: 0,
        centerTitle: false,
        title: TextWidget(
          text: "สินค้าในตะกร้า(4)",
          color: color,
          fontsize: 24,
          title: true,
        ),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.78),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: OrderWidget(),
          );
        }),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: color,
            thickness: 1,
          );
        },
      ),
    );
  }
}
