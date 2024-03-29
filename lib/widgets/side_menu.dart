import 'package:flutter/material.dart';
import 'package:mywebgardenapp/inside_screen/show_all_products.dart';
import 'package:mywebgardenapp/providers/dark_theme_provider.dart';
import 'package:mywebgardenapp/services/utils.dart';
import 'package:mywebgardenapp/widgets/orders/order_list_screen.dart';
import 'package:mywebgardenapp/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../screens/main_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/groceries.png",
            ),
          ),
          DrawerListTile(
            title: "หน้าหลัก",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "รายการสินค้าทั้งหมด",
            press: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AllProductsScreen()));
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "รายการสินค้าที่สั่ง",
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderLists(),
                ),
              );
            },
            icon: IconlyBold.bag_2,
          ),
          SwitchListTile(
              title: const Text('เปลี่ยนสีพื้นหลัง'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              value: theme,
              onChanged: (value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              })
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Icon(
          icon,
          size: 18,
        ),
        title: TextWidget(
          text: title,
          color: Colors.black87,
        ));
  }
}
