// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constant.dart';
import 'package:furniture_app/item.dart';

class Product extends StatefulWidget {
  const Product({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int quantity = 1;
  void increase() {
    setState(() {
      quantity++;
    });
  }

  void decrease() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      widget.item.head,
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      CupertinoIcons.heart,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Hero(
                    tag: widget.item,

                    /// IOS-da düzgün çalışmağı üçün(Səhifədən sürüşdürərək geri qayıdanda)
                    transitionOnUserGestures: true,
                    child: Image.asset(
                      widget.item.assetNAme,
                      width: width * 0.9,
                      height: width * 0.9,
                    )),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.remove),
                          onTap: decrease,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$quantity',
                          style: TextStyle(color: black, fontSize: 24),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          child: Icon(Icons.add),
                          onTap: increase,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  widget.item.subtitle,
                  style: TextStyle(color: black.withOpacity(0.6)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 18, color: black.withOpacity(0.6)),
                        ),
                        Text(
                          widget.item.price,
                          style: TextStyle(
                              fontSize: 20,
                              color: black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                          child: Text(
                        'Buy now',
                        style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
                Divider(color: black, height: 20),
                Image.asset('asset/images/rating.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
