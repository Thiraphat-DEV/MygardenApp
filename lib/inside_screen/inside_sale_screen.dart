import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/sale_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class InsideSaleScreen extends StatelessWidget {
  static const routeName = '/insideSale';
  const InsideSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // handle product is empty
    bool isempty = false;
    // define theme, color and get size of ui
    Color color = GlobalUtils(context).color;
    Size screenSize = GlobalUtils(context).screenSize;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          autofocus: true,
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeftSquare,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Product on sales',
          color: color,
          fontsize: 24,
          title: true,
        ),
      ),
      body: isempty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/emptybox.jpg',
                      height: 300, width: 700, fit: BoxFit.fill),
                ),
                Center(
                  child: TextWidget(
                    text: "No product for Include",
                    fontsize: 30,
                    color: color,
                    title: true,
                  ),
                )
              ],
            )
          : GridView.count(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: screenSize.width / (screenSize.height * 0.59),
              children: List.generate(4, (index) => SalesWidget()),
            ),
    );
  }
}
