import 'package:flutter/material.dart';
import 'package:mygardenapp/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  // define cartItems from CartModel
  Map<String, CartModel> _cartItems = {};

  // get Cart items
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  // define function addProduct to cart with get 2 params productId and quantity 
  void addProductToCart({
    required String productId,
    required int quantity,
  }) {
    // push product with productId to Cart
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
            id: DateTime.now().toString(),
            productId: productId,
            quantity: quantity));
  }
}
