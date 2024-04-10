import 'package:flutter/material.dart';
import 'package:mygardenapp/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProduct {
    return _productsList;
  }

  // define getOnsale of Product
  List<ProductModel> get getOnSaleProduct {
    return _productsList.where((elem) => elem.isOnSale).toList();
  }

  // define function for get product by id from user
  ProductModel findProductById(String productId) {
    return _productsList.firstWhere((elem) => elem.id == productId);
  }

  // define function for get product by category
  List<ProductModel> findByCategory(String category) {
    // check each category of product with use define category to lowercase and  use "contain" for find every case in categories 
    List<ProductModel> categories = _productsList
        .where((element) => element.productCategory
            .toLowerCase()
            .contains(category.toLowerCase()))
        .toList();
    // return list of category
    return categories;
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
        isOnSale: true,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "cat",
        price: 200,
        salePrice: 100,
        isOnSale: true,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "dog",
        price: 200,
        salePrice: 100,
        isOnSale: true,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "Vegetable",
        price: 200,
        salePrice: 100,
        isOnSale: true,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "dog",
        price: 200,
        salePrice: 100,
        isOnSale: true,
        isPiece: false),
    ProductModel(
        id: '2567',
        title: "Hello",
        imgUrl: "https://via.placeholder.com/50x50",
        productCategory: "cat",
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
