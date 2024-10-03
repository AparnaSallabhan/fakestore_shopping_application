import 'dart:convert';

import 'package:fakestore_shopping_application/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> productsList = [];
  List categoriesList = ["All"];
  int selectedIndex = 0;
  bool isProductsLoading = false;

  Future<void> getCategoris() async {
    categoriesList = ["All"];
    notifyListeners();
    var catUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    try {
      var category = await http.get(catUrl);

      if (category.statusCode == 200) {
        categoriesList.addAll(jsonDecode(category.body));
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void onCategorySelection(int index) {
    selectedIndex == index;
    notifyListeners();
    if(selectedIndex==0){
      getAllProducts();
    }
    else{
      getProductsByCategory(categoriesList[selectedIndex]);
    }
  }

  Future<void> getAllProducts() async {
    isProductsLoading = true;
    notifyListeners();
    try {
      var url = Uri.parse("https://fakestoreapi.com/products");
      var product = await http.get(url);
      if (product.statusCode == 200) {
        productsList = productModelFromJson(product.body);
      }
    } catch (e) {
      print(e);
    }
    isProductsLoading = false;
    notifyListeners();
  }

  Future<void> getProductsByCategory(String category) async {
     isLoading = true;
    notifyListeners();
    try {
      var url = Uri.parse("https://fakestoreapi.com/products/category/$category");
      var product = await http.get(url);
      if (product.statusCode == 200) {
        productsList = productModelFromJson(product.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
