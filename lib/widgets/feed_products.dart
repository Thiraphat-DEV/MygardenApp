import 'package:flutter/material.dart';
import 'package:mywebgardenapp/consts/constants.dart';
import 'package:mywebgardenapp/widgets/products_widget.dart';

class FeedProducts extends StatelessWidget {
  const FeedProducts(
      {Key? key,
      this.crossAxisCount = 4,
      this.childAspectRatio = 1,
      this.isMain = true})
      : super(key: key);

  // define axis cross and main for shape
  final int crossAxisCount;
  final double childAspectRatio;
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding),
        itemBuilder: (context, index) {
          return ProductWidget();
        });
  }
}
