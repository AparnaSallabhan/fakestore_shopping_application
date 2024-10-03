// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fakestore_shopping_application/controller/home_screen_controller.dart';
import 'package:fakestore_shopping_application/view/cart_screen/cart_screen.dart';
import 'package:fakestore_shopping_application/view/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getAllProducts();
        context.read<HomeScreenController>().getCategoris();
      },
    );
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) async {
    //     await context.read<HomeScreenController>().getCategoris();
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = context.watch<HomeScreenController>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Text(
            "Discover",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: Icon(Icons.shopping_cart_sharp)),
          Stack(
            children: [
              Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 26,
              ),
              Positioned(
                right: 3,
                top: 4,
                child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.black,
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 6),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),

//main column
      body: homeScreenProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                //1st row of 2 containers
                Row(
                  children: [
                    //container1
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 35,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search anything",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
//container2
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
//row2 - categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      homeScreenProvider.categoriesList.length,
                      (index) => InkWell(
                        onTap: () {
                          context
                              .read<HomeScreenController>()
                              .onCategorySelection(index);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: homeScreenProvider.selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            homeScreenProvider.categoriesList[index],
                            style: TextStyle(
                                color: homeScreenProvider.selectedIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    // children: [
                    //   Container(
                    //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    //     margin: EdgeInsets.symmetric(horizontal: 10),
                    //     decoration: BoxDecoration(
                    //         color: Colors.black,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Text(
                    //       "All",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ),
                    //   Container(
                    //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    //     margin: EdgeInsets.only(right: 10),
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Text(
                    //       "Men",
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //   ),
                    //   Container(
                    //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    //     margin: EdgeInsets.only(right: 10),
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Text(
                    //       "women",
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //   ),
                    //   Container(
                    //     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    //     margin: EdgeInsets.only(right: 10),
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10)),
                    //     child: Text(
                    //       "Kids",
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //   ),
                    // ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                //grid

                Expanded(
                  child: homeScreenProvider.isProductsLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          itemCount: homeScreenProvider.productsList.length,
                          padding: EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                        id: homeScreenProvider
                                            .productsList[index].id
                                            .toString(),
                                      ),
                                    ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(
                                                      homeScreenProvider
                                                          .productsList[index]
                                                          .image
                                                          .toString()))),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
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
                                  Text(
                                    homeScreenProvider.productsList[index].title
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    homeScreenProvider.productsList[index].price
                                        .toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            );
                          }),
                )
              ],
            ),
    );
  }
}
