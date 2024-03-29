import 'package:flutter/material.dart';
import 'package:mywebgardenapp/controllers/MenuProductController.dart';
import 'package:mywebgardenapp/responsive.dart';
import 'package:mywebgardenapp/services/utils.dart';
import 'package:mywebgardenapp/widgets/feed_products.dart';
import 'package:mywebgardenapp/widgets/header.dart';
import 'package:mywebgardenapp/widgets/orders/order_list_screen.dart';
import 'package:mywebgardenapp/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);
  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<MenuProductController>().getgridscaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(child: SideMenu()),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    Header(
                      fct: () {
                        context
                            .read<MenuProductController>()
                            .controlProductsMenu();
                      },
                    ),
                    Responsive(
                      mobile: FeedProducts(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                          isMain: false),
                      desktop: FeedProducts(
                        childAspectRatio: size.width > 1400 ? 0.8 : 1.07,
                        isMain: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
