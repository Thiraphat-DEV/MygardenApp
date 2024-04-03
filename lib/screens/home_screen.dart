import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/consts/consts_product_model.dart';
import 'package:mygardenapp/inside_screen/inside_feed_screen.dart';
import 'package:mygardenapp/inside_screen/inside_sale_screen.dart';
import 'package:mygardenapp/models/product_model.dart';
import 'package:mygardenapp/providers_widget/product_provider.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/feedItems_widget.dart';
import 'package:mygardenapp/widget/sale_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // define utils for use on Screen
    final globalUtil = GlobalUtils(context);
    Color color = globalUtil.color;
    Size screenSize = globalUtil.screenSize;
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProductsList = productProvider.getProduct; 
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.3,
              child: Swiper(
                itemCount: 5,
                viewportFraction: 0.8,
                scale: 0.9,
                itemBuilder: (BuildContext context, int idx) {
                  // add image for  promote mygarden
                  return Image.network('https://via.placeholder.com/150x150',
                      fit: BoxFit.fill);
                },
                autoplay: true,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: color, activeColor: Colors.orange[800])),
                // control: SwiperControl(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  GlobalMethods.navigateTo(
                      context: context, routeName: InsideSaleScreen.routeName);
                },
                child: TextWidget(
                  text: "View All Products",
                  maxLines: 2,
                  color: color,
                  fontsize: 20,
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "Sales".toUpperCase(),
                        color: Colors.red,
                        fontsize: 22,
                        title: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(IconlyLight.discount)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Flexible(
                  child: SizedBox(
                    height: screenSize.height * 0.25,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SalesWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                TextWidget(
                  text: 'Other Products',
                  color: color,
                  fontsize: 20,
                  title: true,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          context: context,
                          routeName: InsideFeedScreen.routeName);
                    },
                    child: TextWidget(
                      text: "Browse All",
                      maxLines: 2,
                      color: color,
                      fontsize: 20,
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            // add feeds of each other product
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: screenSize.width / (screenSize.height * 0.67),
              // generate other product
              children: List.generate(allProductsList.length <  4 ? allProductsList.length : 4, (index) => FeedItemsWidget(
                imgUrl: allProductsList[index].imgUrl,
                title: allProductsList[index].title,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
