import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/screens/cart/cart_widget.dart';
import 'package:mygardenapp/screens/cart/empty_screen.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    bool isEmpty = true;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Cart(10)",
          color: color,
          fontsize: 22,
          title: true,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GlobalMethods.warningDialogMethod(
                  title: "มีของในตะกร้าอยู่รึเปล่าา",
                  subtitle: "เเน่ใจน๊าาว่าจะลบเราอะ",
                  fct: () {},
                  context: context);
            },
            icon: Icon(
              IconlyBroken.delete,
              color: color,
            ),
          ),
        ],
      ),
      // Check EmptyScreen on ProductCart 
      body: isEmpty
          ? EmptyScreen(
            title: "เพิ่มสินค้าเข้าตะกร้าจ้า",
            subtitle: "คุณสามารถเลือกดูสินค้าก่อนได้น๊าา",
            imgPath: 'assets/images/emptybox.jpg',
            buttonText: "ไปยังหน้าสินค้า",
          )
          : Column(
              children: [
                _checkoutWidget(context),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: ((context, index) => CartWidget())),
                ),
              ],
            ),
    );
  }

  Widget _checkoutWidget(context) {
    Color color = GlobalUtils(context).color;
    Size size = GlobalUtils(context).screenSize;
    return SizedBox(
      width: double.infinity,
      height: size.width * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Row(children: [
          Material(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              autofocus: true,
              // borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: TextWidget(
                color: color,
                text: "สินค้าของคุณ",
                fontsize: 20,
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
              child: TextWidget(
            text: "Total: 200 B",
            color: color,
            fontsize: 18,
            title: true,
          ))
        ]),
      ),
    );
  }
}
