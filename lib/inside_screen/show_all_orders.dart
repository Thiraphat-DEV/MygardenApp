import 'package:flutter/material.dart';
import 'package:mywebgardenapp/controllers/MenuProductController.dart';
import 'package:mywebgardenapp/responsive.dart';
import 'package:mywebgardenapp/services/utils.dart';
import 'package:mywebgardenapp/widgets/header.dart';
import 'package:mywebgardenapp/widgets/orders/order_list_screen.dart';
import 'package:mywebgardenapp/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProductController>().getordersProductScaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context)) const Expanded(child: SideMenu()),
          Expanded(
              flex: 5,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    const SizedBox(height: 25,),
                    Header(
                      fct: () {
                        context
                            .read<MenuProductController>()
                            .controlAllOrder();
                      },
                      title: "รายการสั่งสินค้าทั้งหมด",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: OrderLists(),
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
