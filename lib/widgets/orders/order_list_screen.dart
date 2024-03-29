import 'package:flutter/material.dart';
import 'package:mywebgardenapp/consts/constants.dart';
import 'package:mywebgardenapp/widgets/orders/order_widget.dart';

class OrderLists extends StatelessWidget {
  const OrderLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                OrderWidget(),
                Divider(
                  thickness: 3,
                ),
              ],
            );
          }),
    );
  }
}
