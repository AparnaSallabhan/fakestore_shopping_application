// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fakestore_shopping_application/controller/product_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<ProductDetailsScreenController>()
            .getProductDetails(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsScreenProvider =
        context.watch<ProductDetailsScreenController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          Stack(
            children: [
              Icon(Icons.notifications_none_outlined),
              Positioned(
                top: 4,
                right: 3,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black,
                  child: Text("1",
                      style: TextStyle(fontSize: 6, color: Colors.white)),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ProductDetailsScreenProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      ProductDetailsScreenProvider
                                          .productDetails!.image
                                          .toString()))),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 28,
                              weight: 300,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ProductDetailsScreenProvider.productDetails!.title.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        "${ProductDetailsScreenProvider.productDetails!.rating!.rate.toString()}/5 ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "(45 reviews)",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    softWrap: true,
                    ProductDetailsScreenProvider.productDetails!.description.toString(),
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose size",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "S",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "M",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "L",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("price"),
                            Text(ProductDetailsScreenProvider.productDetails!.price.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
