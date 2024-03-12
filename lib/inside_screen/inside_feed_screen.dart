import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/feedItems_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class InsideFeedScreen extends StatefulWidget {
  static const routeName = '/feed_screen';
  const InsideFeedScreen({super.key});

  @override
  State<InsideFeedScreen> createState() => _InsideFeedScreenState();
}

class _InsideFeedScreenState extends State<InsideFeedScreen> {
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
                      children: List.generate(4, (index) => FeedItemsWidget()),
                    ),
                  ],
                ),
              ));
  }
}
