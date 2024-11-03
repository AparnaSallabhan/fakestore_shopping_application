// ignore_for_file: prefer_const_constructors

import 'package:fakestore_shopping_application/controller/cart_screen_controller.dart';
import 'package:fakestore_shopping_application/controller/home_screen_controller.dart';
import 'package:fakestore_shopping_application/controller/product_details_screen_controller.dart';
import 'package:fakestore_shopping_application/model/cart_model.dart';
import 'package:fakestore_shopping_application/view/get_started_screren/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  var box = await Hive.openBox<CartModel>("cartBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController(),),
        ChangeNotifierProvider(create: (context) => ProductDetailsScreenController(),),
        ChangeNotifierProvider(create: (context) => CartScreenController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStartedScreen(),
      ),
    );
  }
}