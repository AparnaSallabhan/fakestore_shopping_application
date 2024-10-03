import 'package:fakestore_shopping_application/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailsScreenController with ChangeNotifier {
  ProductModel ?productDetails;
  bool isLoading = false;
  getProductDetails(String productId) async {
    isLoading=true;
    notifyListeners();
   try {var url = Uri.parse("https://fakestoreapi.com/products/$productId");
    var productDetailsRes = await http.get(url);
    if(productDetailsRes.statusCode == 200){
      productDetails =singleProductModelFromJson(productDetailsRes.body);
    }
    }
  catch(e){
    print(e);
  }
  isLoading=false;
  notifyListeners();
  }
}
