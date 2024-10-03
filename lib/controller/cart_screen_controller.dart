import 'package:fakestore_shopping_application/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartScreenController with ChangeNotifier{
  final cartbBox = Hive.box<CartModel>("cartBox");
  void addProduct(){}
  void getProduct(){}
  void removeProduct(){}
  void incrementQuantity(){}
  void decrementQuantity(){}
}