import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/models/product_model.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/heartbtn_widget.dart';
import 'package:mygardenapp/widget/price_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';
import 'package:provider/provider.dart';

class FeedItemsWidget extends StatefulWidget {
  const FeedItemsWidget({super.key});

  @override
  State<FeedItemsWidget> createState() => _FeedItemsWidgetState();
}

class _FeedItemsWidgetState extends State<FeedItemsWidget> {
  final TextEditingController _qualityController = TextEditingController();

  @override
  void initState() {
    _qualityController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _qualityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    Size size = GlobalUtils(context).screenSize;
    final productModel = Provider.of<ProductModel>(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          // go to detail of product by id
          Navigator.pushNamed(context, InsideProductDetail.routeName,
              arguments: productModel.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FancyShimmerImage(
                imageUrl: productModel.imgUrl,
                width: size.width * 0.25,
                height: size.width * 0.25,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextWidget(
                        text: productModel.title,
                        color: color,
                        maxLines: 1,
                        fontsize: 16,
                        title: true,
                      ),
                    ),
                    const Flexible(flex: 1, child: HeartBtnWidget()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(
                      salePrice: productModel.salePrice,
                      price: productModel.price,
                      textPrice: _qualityController.text,
                      isSale: productModel.isOnSale,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 6,
                            child: FittedBox(
                              child: TextWidget(
                                color: color,
                                text: productModel.isPiece ? "Piece" : "/G",
                                fontsize: 20,
                                title: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              autocorrect: true,
                              controller: _qualityController,
                              key: const ValueKey('100 ฿'),
                              style: TextStyle(color: color, fontSize: 14),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide())),
                              textAlign: TextAlign.center,
                              cursorColor: Colors.greenAccent,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]'))
                              ],
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty || int.parse(value) < 0) {
                                    _qualityController.text = '1';
                                  } else {
                                    _qualityController.text = value;
                                  }
                                });
                              },
                              onSaved: (value) {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    color: color,
                    text: "Add to Cart",
                    fontsize: 20,
                    maxLines: 1,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0))))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
