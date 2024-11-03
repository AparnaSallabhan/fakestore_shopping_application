// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CartScreenCard extends StatelessWidget {
  const CartScreenCard({
    super.key,
    required this.image,
    required this.id,
    required this.description,
    required this.name,
    required this.quantity,
    required this.price,
    this.onCancel,
    this.onDecrement,
    this.onIncrement
  });
  final String image;
  final int id;
  final String description;
  final String name;
  final int quantity;
  final double price;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onCancel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "sdfghjkl",
                   // name,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      
                      fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "asdfuimbnvrtygu",
                    //description,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  ElevatedButton.icon(onPressed:onIncrement, label: Icon(Icons.add)),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                      onPressed:onDecrement, label: Icon(Icons.minimize))
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: onCancel,
            child: Container(
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
