import 'package:flutter/material.dart';
import 'package:mygardenapp/inside_screen/inside_category_screen.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(
      {Key? key,
      required this.categoryText,
      required this.imgPath,
      required this.boxColor})
      : super(key: key);
  // define parameters for use with call to CategoriesWidget
  String categoryText, imgPath;
  Color boxColor;

  @override
  Widget build(BuildContext context) {
    // define screen width value from ui
    double _screenWidth = MediaQuery.of(context).size.width;
    // get color follow up themeColor
    final globalUtil = GlobalUtils(context);
    Color color = globalUtil.color;
    return InkWell(
      onTap: () {
        // go to product with category
        Navigator.pushNamed(context, InsideCategoryScreen.routeName, arguments: categoryText);
      },
      child: Container(
        decoration: BoxDecoration(
            color: boxColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: boxColor.withOpacity(0.8), width: 3)),
        child: Column(children: [
          Container(
            height: _screenWidth * 0.3,
            width: _screenWidth * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill)),
          ),
          TextWidget(
            text: categoryText,
            color: color,
            fontsize: 20,
            title: true,
          )
        ]),
      ),
    );
  }
}
