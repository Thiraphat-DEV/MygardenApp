import 'package:flutter/material.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/categories_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  // define color of each product in BoxDecoration
  List<Color> boxColor = const [
    Color(0xFFd1fb96),
    Color(0xFFc0ee3c),
    Color(0xFF93c12d),
    Color(0xFF51983c),
    Color(0xFF006525),
    Color(0xFFFFD1DC),
    Color(0xFFADD8E6),
    Color(0xFFAED8B2)
  ];
  // define each product with dictionary for generate to ui
  List<Map<String, dynamic>> productsList = [
    {
      'prodText': 'bananaSickle',
      'path': 'assets/images/cannabis/bananasickle.jpg'
    },
    {
      'prodText': 'blackCherry',
      'path': 'assets/images/cannabis/black_cherry.jpg'
    },
    {
      'prodText': 'cherryGenc',
      'path': 'assets/images/cannabis/cherrygarcy.jpg'
    },
    {'prodText': 'female', 'path': 'assets/images/cannabis/emergenc.jpg'},
    {'prodText': 'male', 'path': 'assets/images/cannabis/female.jpg'},
    {'prodText': 'LGBTQ', 'path': 'assets/images/cannabis/female2.jpg'},
    {'prodText': 'Mandarin', 'path': 'assets/images/cannabis/mandarin.jpg'},
    {
      'prodText': 'Platinum_kush',
      'path': 'assets/images/cannabis/platinum_kush (1).jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final globalUtils = GlobalUtils(context);
    Color color = globalUtils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        title: TextWidget(
          text: "Products",
          fontsize: 24,
          color: color,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 250 / 250,
          crossAxisSpacing: 30, // vertical spacing
          mainAxisSpacing: 30, // horizontal spacing
          children: List.generate(productsList.length, (index) {
            return CategoriesWidget(
              productText: productsList[index]['prodText'],
              imgPath: productsList[index]['path'],
              boxColor: boxColor[index],
            );
          }),
        ),
      ),
    );
  }
}
