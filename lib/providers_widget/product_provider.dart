import 'package:flutter/material.dart';
import 'package:mygardenapp/models/product_model.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> get getProduct {
    return _productsList;
  }

  // define list of parameter for use
  static final List<ProductModel> _productsList = [
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "Vegetable",
        price: 200,
        salePrice: 100,
        isOnSale: false,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "Vegetable",
        price: 200,
        salePrice: 100,
        isOnSale: false,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "Vegetable",
        price: 200,
        salePrice: 100,
        isOnSale: false,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "Vegetable",
        price: 200,
        salePrice: 100,
        isOnSale: false,
        isPiece: false),
  ];
}
