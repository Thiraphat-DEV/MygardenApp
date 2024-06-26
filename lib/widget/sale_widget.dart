import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/models/product_model.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/heartbtn_widget.dart';
import 'package:mygardenapp/widget/price_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';
import 'package:provider/provider.dart';

class SalesWidget extends StatefulWidget {
  const SalesWidget({super.key});

  @override
  State<SalesWidget> createState() => _SalesWidgetState();
}

class _SalesWidgetState extends State<SalesWidget> {
  @override
  Widget build(BuildContext context) {
    // define theme, color and get size of ui
    Color color = GlobalUtils(context).color;
    Size size = GlobalUtils(context).screenSize;
    // define product provider
    final productSale = Provider.of<ProductModel>(context);
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      color: Theme.of(context).cardColor.withOpacity(0.9),
      child: InkWell(
        autofocus: true,
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          // go to  sale product by id
          Navigator.pushNamed(context, InsideProductDetail.routeName,
              arguments: productSale.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FancyShimmerImage(
                    imageUrl: productSale.imgUrl,
                    width: size.width * 0.19,
                    height: size.width * 0.19,
                    boxFit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(
                          text: productSale.isPiece ? "1Piece" : "1G",
                          color: color,
                          fontsize: 22,
                          title: true),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('purchase product');
                            },
                            child: Icon(
                              IconlyLight.bag2,
                              size: 20,
                              color: color,
                            ),
                          ),
                          HeartBtnWidget()
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              PriceWidget(
                salePrice: productSale.salePrice,
                price: productSale.price,
                textPrice: '1',
                isSale:productSale.isOnSale,
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: productSale.title,
                color: color,
                fontsize: 16,
                title: true,
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
