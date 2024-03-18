import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mygardenapp/screens/wishlist/wishlist_widget.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/background_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    return Scaffold(
        appBar: AppBar(
          leading: BackgroundWidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: "This is Your Liked Product",
            color: color,
            fontsize: 22,
            title: true,
          ),
        ),
        body: MasonryGridView.count(
          // maxCrossAxisExtent: 2,
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          itemBuilder: (context, index) {
            return WishlistWidget();
          },
        ));
  }
}
