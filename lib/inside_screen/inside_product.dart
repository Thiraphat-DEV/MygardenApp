import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/heartbtn_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class InsideProductDetail extends StatefulWidget {
  static const routeName = '/insideProductDetails';

  const InsideProductDetail({Key? key}) : super(key: key);

  @override
  _InsideProductDetailState createState() => _InsideProductDetailState();
}

class _InsideProductDetailState extends State<InsideProductDetail> {
  final _quantityTextController = TextEditingController(text: '1');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = GlobalUtils(context).screenSize;
    final Color color = GlobalUtils(context).color;

    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () =>
                Navigator.canPop(context) ? Navigator.pop(context) : null,
            child: Icon(
              IconlyLight.arrowLeft2,
              color: color,
              size: 24,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Column(children: [
        Flexible(
          flex: 2,
          child: FancyShimmerImage(
            imageUrl: "https://via.placeholder.com/50x50",
            width: size.width * 0.70,
            height: size.width * 0.70,
            // boxFit: BoxFit.fill,
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextWidget(
                          text: 'title',
                          color: color,
                          fontsize: 25,
                          title: true,
                        ),
                      ),
                      const HeartBtnWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: '200 Bath',
                        color: Colors.green,
                        fontsize: 22,
                        title: true,
                      ),
                      TextWidget(
                        text: '/G',
                        color: color,
                        fontsize: 12,
                        title: false,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Visibility(
                        visible: true,
                        child: Text(
                          '300 Baht',
                          style: TextStyle(
                              fontSize: 15,
                              color: color,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(63, 200, 101, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextWidget(
                          text: 'ส่งฟรีไม่มีขั้นต่ำ',
                          color: Colors.white,
                          fontsize: 20,
                          title: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    quantityControlMethod(
                      fct: () {
                        if (_quantityTextController.text == '1' ||
                            int.parse(_quantityTextController.text) <= 0) {
                          return;
                        } else {
                          setState(() {
                            _quantityTextController.text =
                                (int.parse(_quantityTextController.text) - 1)
                                    .toString();
                          });
                        }
                      },
                      icon: CupertinoIcons.minus,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: _quantityTextController,
                        key: const ValueKey('quantity'),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.green,
                        enabled: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _quantityTextController.text = '1';
                            } else {}
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    quantityControlMethod(
                      fct: () {
                        setState(() {
                          _quantityTextController.text =
                              (int.parse(_quantityTextController.text) + 1)
                                  .toString();
                        });
                      },
                      icon: CupertinoIcons.plus,
                      color: Colors.green,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'รวม',
                              color: Colors.red.shade300,
                              fontsize: 20,
                              title: true,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  TextWidget(
                                    text: '200 Bath/',
                                    color: color,
                                    fontsize: 20,
                                    title: true,
                                  ),
                                  TextWidget(
                                    text: '${_quantityTextController.text}Kg',
                                    color: color,
                                    fontsize: 16,
                                    title: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Material(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TextWidget(
                                    text: 'เพิ่มเข้าตะกร้า',
                                    color: Colors.white,
                                    fontsize: 18)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget quantityControlMethod(
      {required Function fct, required IconData icon, required Color color}) {
    return Flexible(
      flex: 2,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: color,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            )),
      ),
    );
  }
}
