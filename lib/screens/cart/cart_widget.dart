import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/heartbtn_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityController = TextEditingController(text: '1');

  @override
  void initState() {
    // TODO: implement initState
    _quantityController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = GlobalUtils(context).screenSize;
    Color color = GlobalUtils(context).color;
    return GestureDetector(
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: InsideProductDetail.routeName);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: FancyShimmerImage(
                        imageUrl: "https://via.placeholder.com/50x50",
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        // boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Product",
                          color: color,
                          fontsize: 20,
                          title: true,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              _quantityMethod(
                                  func: () {
                                    if (int.parse(_quantityController.text) <=
                                        0) {
                                      return;
                                    } else {
                                      setState(() {
                                        _quantityController.text = (int.parse(
                                                    _quantityController.text) -
                                                1)
                                            .toString();
                                      });
                                    }
                                  },
                                  icon: CupertinoIcons.minus,
                                  color: Colors.red),
                              // add text field between increase and decrease quantity
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: _quantityController,
                                  style: TextStyle(color: color),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide())),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9.,]'))
                                  ],
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      _quantityController.text = value;
                                    } else {
                                      return;
                                    }
                                  },
                                ),
                              ),
                              _quantityMethod(
                                  func: () {
                                    if (int.parse(_quantityController.text) <=
                                        0) {
                                      return;
                                    } else {
                                      setState(() {
                                        _quantityController.text = (int.parse(
                                                    _quantityController.text) +
                                                1)
                                            .toString();
                                      });
                                    }
                                  },
                                  icon: CupertinoIcons.add,
                                  color: Colors.lightGreenAccent)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8.0),
                      child: Column(
                        children: [
                          const InkWell(
                            child: Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const HeartBtnWidget(),
                          TextWidget(
                            text: "50฿",
                            color: color,
                            fontsize: 18,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // call function _quantityMethod for increase and decrease quantity of product with required{function, icon, color}
  Widget _quantityMethod(
      {required Function func, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            autofocus: true,
            onTap: () {
              func();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
