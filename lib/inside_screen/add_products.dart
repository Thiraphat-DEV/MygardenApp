import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:mywebgardenapp/controllers/MenuProductController.dart';
import 'package:mywebgardenapp/responsive.dart';
import 'package:mywebgardenapp/services/utils.dart';
import 'package:mywebgardenapp/widgets/buttons.dart';
import 'package:mywebgardenapp/widgets/header.dart';
import 'package:mywebgardenapp/widgets/side_menu.dart';
import 'package:mywebgardenapp/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatefulWidget {
  static const routeName = '/AddProductForm';

  const AddProductForm({Key? key}) : super(key: key);

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController, _priceController;

  @override
  void initState() {
    _priceController = TextEditingController();
    _titleController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;
    final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    Size size = Utils(context).getScreenSize;

    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: _scaffoldColor,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.0,
        ),
      ),
    );
    return Scaffold(
      key: context.read<MenuProductController>().getAddProductscaffoldKey,
      drawer: const SideMenu(),
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(fct: () {
                    context.read<MenuProductController>().controlAddProductsMenu();
                  }, title: 'เพิ่มสินค้าเข้าคลัง',),
                  Container(
                    width: size.width > 650 ? 650 : size.width,
                    color: Theme.of(context).cardColor,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextWidget(
                            text: 'ชื่อสินค้า',
                            color: color,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _titleController,
                            key: const ValueKey('ชื่อสินค้า'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณาใส่ชื่อสินค้า';
                              }
                              return null;
                            },
                            decoration: inputDecoration,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: FittedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'ราคาสินค้า',
                                        color: color,
                                        isTitle: true,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        height: 80,
                                        child: TextFormField(
                                          controller: _priceController,
                                          key: const ValueKey('ราคาสินค้า'),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'กรุณาใส่ราคาสินค้า';
                                            }
                                            return null;
                                          },
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9.]')),
                                          ],
                                          decoration: inputDecoration,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextWidget(
                                        text: 'ประเภทสินค้า',
                                        color: color,
                                        isTitle: true,
                                      ),
                                      const SizedBox(height: 10),
                                      // Drop down menu code here
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextWidget(
                                        text: 'จำนวนสินค้า(KG)',
                                        color: color,
                                        isTitle: true,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Radio button code here
                                    ],
                                  ),
                                ),
                              ),
                              // Image to be picked code is here
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                    color: Colors.red,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: TextWidget(
                                            text: 'ล้าง',
                                            color: Colors.red,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: TextWidget(
                                            text: 'เพิ่มรูปภาพสินค้า',
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonsWidget(
                                  onPressed: () {},
                                  text: 'ล้างฟอร์ม',
                                  icon: IconlyBold.danger,
                                  backgroundColor: Colors.red.shade300,
                                ),
                                ButtonsWidget(
                                  onPressed: () {
                                    _uploadForm();
                                  },
                                  text: 'อัปโหลดฟอร์ม',
                                  icon: IconlyBold.upload,
                                  backgroundColor: Colors.blue,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
