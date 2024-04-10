import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/models/product_model.dart';
import 'package:mygardenapp/providers_widget/product_provider.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/empty_product_widget.dart';
import 'package:mygardenapp/widget/feedItems_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';
import 'package:provider/provider.dart';

class InsideCategoryScreen extends StatefulWidget {
  static const routeName = '/CategoryScreen';
  const InsideCategoryScreen({super.key});

  @override
  State<InsideCategoryScreen> createState() => _InsideCategoryScreenState();
}

class _InsideCategoryScreenState extends State<InsideCategoryScreen> {
  final TextEditingController? _searchProduct = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  //dispose function
  @override
  void dispose() {
    _searchProduct!.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // handle product is empty
    bool isempty = false;
    // define theme, color and get size of ui
    Color color = GlobalUtils(context).color;
    Size screenSize = GlobalUtils(context).screenSize;
    // get function findByCategory with name of category
    final productProvider = Provider.of<ProductProvider>(context);
    // get category name with ModalRouteName
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    List<ProductModel> productByCategory =
        productProvider.findByCategory(categoryName);

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
            text: "Category of Product",
            color: color,
            fontsize: 24,
            title: true,
          ),
        ),
        body: productByCategory.isEmpty
            ? const EmptyProductWidget(
                text: "No Product in Category",
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: TextField(
                          focusNode: _searchFocusNode,
                          controller: _searchProduct,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.lightGreenAccent, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.lightGreenAccent, width: 0.5),
                              ),
                              hintText: "ค้นหาสินค้าที่ใช่สำหรับคุณ",
                              prefixIcon: const Icon(IconlyBold.search),
                              suffix: IconButton(
                                onPressed: () {
                                  _searchProduct!.clear();
                                  _searchFocusNode.unfocus();
                                },
                                icon: Icon(
                                  IconlyBold.closeSquare,
                                  color: _searchFocusNode.hasFocus
                                      ? Colors.redAccent
                                      : color,
                                ),
                              )),
                        ),
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      padding: EdgeInsets.zero,
                      childAspectRatio:
                          screenSize.width / (screenSize.height * 0.65),
                      children: List.generate(
                          productByCategory.length < 4
                              ? productByCategory.length
                              : 4,
                          (index) => ChangeNotifierProvider.value(
                              value: productByCategory[index],
                              child: const FeedItemsWidget())),
                    ),
                  ],
                ),
              ));
  }
}
