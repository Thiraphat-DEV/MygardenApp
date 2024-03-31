import 'package:flutter/material.dart';
import 'package:mywebgardenapp/consts/constants.dart';
import 'package:mywebgardenapp/inside_screen/add_products.dart';
import 'package:mywebgardenapp/inside_screen/show_all_products.dart';
import 'package:mywebgardenapp/responsive.dart';
import 'package:mywebgardenapp/services/global_method.dart';
import 'package:mywebgardenapp/services/utils.dart';
import 'package:mywebgardenapp/widgets/buttons.dart';
import 'package:mywebgardenapp/widgets/feed_products.dart';
import 'package:mywebgardenapp/widgets/header.dart';
import 'package:mywebgardenapp/widgets/orders/order_list_screen.dart';
import 'package:mywebgardenapp/widgets/products_widget.dart';
import 'package:mywebgardenapp/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:mywebgardenapp/controllers/MenuProductController.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define size and color with follow up to theme
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "ภาพรวมของสินค้า",
              fct: () {
                context.read<MenuProductController>().controlDashboarkMenu();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(text: "สินค้าล่าสุด", color: color),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ButtonsWidget(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllProductsScreen(),
                          ),
                        );
                      },
                      text: 'สินค้าทั้งหมด',
                      icon: Icons.store,
                      backgroundColor: color),
                  const Spacer(),
                  ButtonsWidget(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductForm(),
                          ),
                        );
                      },
                      text: 'เพิ่มสินค้า',
                      icon: Icons.add_box_rounded,
                      backgroundColor: color),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: FeedProducts(
                          crossAxisCount: size.width < 650 ? 2 : 3,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: FeedProducts(
                          childAspectRatio: size.width < 1400 ? 0.5 : 1.05,
                        ),
                      ),
                      Responsive(mobile: OrderLists(), desktop: OrderLists())
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
