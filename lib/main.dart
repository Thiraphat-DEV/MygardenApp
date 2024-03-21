import 'package:flutter/material.dart';
import 'package:mygardenapp/consts/theme_data.dart';
import 'package:mygardenapp/inside_screen/inside_feed_screen.dart';
import 'package:mygardenapp/inside_screen/inside_product.dart';
import 'package:mygardenapp/inside_screen/inside_sale_screen.dart';
import 'package:mygardenapp/provider/dark_theme_provider.dart';
import 'package:mygardenapp/screens/bottombar_screen.dart';
import 'package:mygardenapp/screens/orders/order_screen.dart';
import 'package:mygardenapp/screens/view/view_product_screen.dart';
import 'package:mygardenapp/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Garden APP',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: BottomBarScreen(),
          // connect route of Screen
          routes: {
            InsideSaleScreen.routeName: (ctx) => const InsideSaleScreen(),
            InsideFeedScreen.routeName: (ctx) => const InsideFeedScreen(),
            InsideProductDetail.routeName: (ctx) => const InsideProductDetail(),
            WishListScreen.routeName: (ctx) => const WishListScreen(),
            OrderScreen.routeName: (ctx) => const OrderScreen(),
            ViewProductScreen.routeName: (ctx) => const ViewProductScreen(),
          },
        );
      }),
    );
  }
}
