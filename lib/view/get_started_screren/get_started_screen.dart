// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fakestore_shopping_application/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://i.pinimg.com/564x/8f/f1/d9/8ff1d9a3fb0e66c0edb29dcaf64090ac.jpg"))
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Get Started", style: TextStyle(color: Colors.white),),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward_outlined,color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}