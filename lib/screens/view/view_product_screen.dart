import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mygardenapp/screens/cart/empty_screen.dart';
import 'package:mygardenapp/screens/view/view_product_widget.dart';
import 'package:mygardenapp/services/global_method.dart';
import 'package:mygardenapp/services/global_utils.dart';
import 'package:mygardenapp/widget/background_widget.dart';
import 'package:mygardenapp/widget/textwidget.dart';

class ViewProductScreen extends StatefulWidget {
  const ViewProductScreen({super.key});
  static const routeName = "/ViewProductScreen";

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = GlobalUtils(context).color;
    const isEmpty = true;
    return isEmpty
        ? EmptyScreen(
            imgPath: "assets/images/history.png",
            title: "ยังไม่มีสินค้าที่คุณสนใจ",
            subtitle: "สามารถเลือกดูสินค้าที่อาจสนใจก่อนได้น๊าา",
            buttonText: "ไปดูสินค้ากัน")
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialogMethod(
                        title: "ต้องการลบจริงหรอ",
                        subtitle: "เก็บไว้ก่อนไหม",
                        fct: () {},
                        context: context);
                  },
                  icon: Icon(IconlyBroken.delete),
                ),
              ],
              leading: BackgroundWidget(),
              automaticallyImplyLeading: false,
              elevation: 0,
              centerTitle: true,
              title: TextWidget(
                color: color,
                fontsize: 24,
                text: "ประวัติการดูสินค้าของคุณ",
              ),
              backgroundColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
            ),
            body: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: ViewProductWidget(),
              );
            }),
          );
  }
}
