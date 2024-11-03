//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:fakestore_shopping_application/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreenController with ChangeNotifier {
  final cartbBox = Hive.box<CartModel>("cartBox");
  List keys = [];
  List<CartModel> cart = [];
  double totalCartValue = 0;

  Future<void> addProduct({
    String? name,
    String? desc,
    String? image,
    required int id,
    required double price,
  }) async {
    //cartQuantity=1;
    // await cartbBox.add(CartModel(
    //     name: name,
    //     description: desc,
    //     id: id,
    //     price: price,
    //     quantity: cartQuantity,
    //     image: image));

    bool isAlreadyInCart = false;
    for (int i = 0; i < cart.length; i++) {
      if (id == cart[i].id) {
        isAlreadyInCart = true;
      } else {}
    }

    if (isAlreadyInCart == true) {
      print("already added");
    } else {
      await cartbBox.add(CartModel(
          name: name,
          description: desc,
          id: id,
          price: price,
          quantity: 1,
          image: image));
    }

    getProducts();
  }

  void getProducts() {
    keys = cartbBox.keys.toList();
    cart = cartbBox.values.toList();
    calculateTotalAmount();
    notifyListeners();
    //debugPrint(keys.toString());
  }

  void removeProduct(int index) {
    cartbBox.deleteAt(index);
    getProducts();
  }

  void incrementQuantity(int index) {
    int currentQuantity = cart[index].quantity ?? 1;
    currentQuantity++;
    print("::::::::::::$currentQuantity");
    cartbBox.put(
        keys[index],
        CartModel(
          name: cart[index].name,
          id: cart[index].id,
          description: cart[index].description,
          image: cart[index].image,
          price: cart[index].price,
          quantity: currentQuantity,
        ));
    getProducts();
  }

  void decrementQuantity(int index) {
    int currentQuantity = cart[index].quantity!;
    if(currentQuantity>1){
      currentQuantity--;
      cartbBox.put(
        keys[index],
        CartModel(
          name: cart[index].name,
          id: cart[index].id,
          description: cart[index].description,
          image: cart[index].image,
          price: cart[index].price,
          quantity: currentQuantity,
        ));
    }
    getProducts();
  }

  void calculateTotalAmount(){
    totalCartValue = 0;
    for(int i=0; i<cart.length;i++){
      totalCartValue = totalCartValue+(cart[i].price! * cart[i].quantity!);
    }
    print(totalCartValue);
  }
}
