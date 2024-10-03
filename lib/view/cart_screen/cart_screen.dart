// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fakestore_shopping_application/view/cart_screen/widgets/cart_screen_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("My Cart"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => CartScreenCard(
            image:"https://i.pinimg.com/564x/8f/f1/d9/8ff1d9a3fb0e66c0edb29dcaf64090ac.jpg" ,
            name: "title",
            description: "description",
            price: 1000,
            id: 1,
            quantity: 2,
          ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: 5),
    );
  }
}

