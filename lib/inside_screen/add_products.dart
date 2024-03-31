import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mywebgardenapp/controllers/MenuProductController.dart';
import 'package:mywebgardenapp/responsive.dart';
import 'package:mywebgardenapp/services/utils.dart';
import 'package:mywebgardenapp/widgets/buttons.dart';
import 'package:mywebgardenapp/widgets/header.dart';
import 'package:mywebgardenapp/widgets/side_menu.dart';
import 'package:mywebgardenapp/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  String _categoryValue = 'cat1';
  late final TextEditingController _titleController, _priceController;

  int _groupUnits = 1;
  bool isPiece = false;
  File? pickedImage;
  Uint8List webImage = Uint8List(8);
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
                  Header(
                    fct: () {
                      context
                          .read<MenuProductController>()
                          .controlAddProductsMenu();
                    },
                    title: 'เพิ่มสินค้าเข้าคลัง',
                  ),
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
                                        width: 150,
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
                                      categoryDropdown(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextWidget(
                                        text: 'จำนวนสินค้า',
                                        color: color,
                                        isTitle: true,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Radio button code here
                                      Row(
                                        children: [
                                          TextWidget(
                                              text: "กิโลกรัม", color: color),
                                          Radio(
                                            value: 1,
                                            groupValue: _groupUnits,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupUnits = 1;
                                                isPiece = false;
                                              });
                                            },
                                            activeColor: Colors.green,
                                          ),
                                          TextWidget(
                                              text: "ชิ้น", color: color),
                                          Radio(
                                            value: 2,
                                            groupValue: _groupUnits,
                                            onChanged: (val) {
                                              setState(() {
                                                _groupUnits = 2;
                                                isPiece = true;
                                              });
                                            },
                                            activeColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Image to be picked code is here
                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: size.width > 650
                                          ? 350
                                          : size.width * 0.45,

                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      // call function boxImageProduct with choose product from user
                                      child: boxImageProduct(color: color),
                                    ),
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

  // define function for choose image from user and push to show in the box of interface
  Future<void> pickImageProduct() async {
    if (!kIsWeb) {
      final ImagePicker _pickedImage = ImagePicker();
      // choose source and select image
      XFile? image = await _pickedImage.pickImage(source: ImageSource.gallery);

      // selected Image
      if (image != null) {
        var selectedImage = File(image.path);
        setState(() {
          pickedImage = selectedImage;
        });
      } else {
        // throw error
        print("คุณไม่ได้เลือกรูปภาพสินค้า");
      }
    } else if (kIsWeb) {
      ImagePicker _pickedImage = ImagePicker();

      XFile? image = await _pickedImage.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var imgFile = await image.readAsBytes();
        setState(() {
          webImage = imgFile;
          _pickedImage = File('a') as ImagePicker;
        });
      } else {
        // throw error
        print("คุณไม่ได้เลือกรูปภาพสินค้า");
      }
    } else {
      print('กรุณาเลือกรูปภาพสินค้า');
    }
  }

  // define box for get image product from user
  Widget boxImageProduct({required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        dashPattern: const [6.7],
        borderType: BorderType.RRect,
        color: color,
        radius: const Radius.circular(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.image_outlined,
                color: color,
                size: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    pickImageProduct();
                  },
                  child: TextWidget(
                    text: 'เลือกรูปภาพสินค้า',
                    color: color,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // define category dropdown of product
  Widget categoryDropdown() {
    Color color = Utils(context).color;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 20, color: color),
            value: _categoryValue,
            onChanged: (value) {
              setState(() {
                _categoryValue = value!;
              });
            },
            hint: const Text("เลือกประเภทสินค้า"),
            items: const [
              DropdownMenuItem(
                child: Text('cat1'),
                value: 'cat1',
              ),
              DropdownMenuItem(
                child: Text('cat2'),
                value: 'cat2',
              ),
              DropdownMenuItem(
                child: Text('cat3'),
                value: 'cat3',
              ),
              DropdownMenuItem(
                child: Text('cat4'),
                value: 'cat4',
              ),
              DropdownMenuItem(
                child: Text('cat5'),
                value: 'cat5',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
