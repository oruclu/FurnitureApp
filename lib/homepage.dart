// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:furniture_app/constant.dart';
import 'package:furniture_app/item.dart';
import 'package:furniture_app/product.dart';
import 'package:furniture_app/tk_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Tk.menu2,
                  size: 22,
                ),
                ClipPath(
                  clipper: CustomClip(),
                  child: Container(
                    width: 45,
                    height: 53,
                    color: secondColor,
                    child: Icon(
                      Tk.cart,
                      color: white,
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Furniture in\nUnique Style',
              style: TextStyle(
                color: black,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We have wide range of Furniture',
              style: TextStyle(
                color: black.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tables',
                  style: TextStyle(
                    fontSize: 16,
                    color: black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'Chairs',
                  style: TextStyle(
                    fontSize: 16,
                    color: black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'Lamps',
                  style: TextStyle(
                    fontSize: 16,
                    color: black.withOpacity(0.5),
                  ),
                ),
                Text(
                  'All',
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: item,

                          /// IOS-da düzgün çalışmağı üçün(Səhifədən sürüşdürərək geri qayıdanda)
                          transitionOnUserGestures: true,
                          child: Image.asset(
                            item.assetNAme,
                            width: width / 3,
                            height: width / 3,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.subtitle,
                                style: TextStyle(color: black.withOpacity(0.6)),
                              ),
                              Text(
                                item.price,
                                style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30)
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Product(item: item)));
                    },
                  );
                },
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: ClipPath(
        clipper: BotNavClip(),
        child: Container(
          height: 93,
          color: mainColor,
          child: Container(
            height: 60,
            margin: EdgeInsets.only(top: 30),
            child: bottomNavBar(),
          ),
        ),
      ),
    );
  }

  NavigationBar bottomNavBar() {
    return NavigationBar(
      backgroundColor: mainColor,
      indicatorColor: mainColor,
      selectedIndex: 0,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: [
        NavigationDestination(
            icon: Icon(
              Tk.homeOut,
              color: white.withOpacity(0.8),
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(
              Tk.msg,
              color: white,
              size: 28,
            ),
            label: 'Messages'),
        NavigationDestination(
            icon: Icon(
              Tk.user,
              size: 28,
              color: white.withOpacity(0.8),
            ),
            label: 'Profil'),
      ],
    );
  }

  final items = <Item>[
    Item(
        head: 'Lamp',
        title: 'Elegance Lamp',
        subtitle: 'We have amazing quality Lamp Wide range',
        price: '\$20.00',
        assetNAme: 'asset/images/lamp.jpg'),
    Item(
        head: 'Table',
        title: 'Modern Table',
        subtitle: 'New style of tables for your Homes and offices',
        price: '\$40.00',
        assetNAme: 'asset/images/table.jpg'),
    Item(
      head: 'Chair',
      title: 'Comfortable Chair',
      subtitle:
          'Customize your home or office with our multiple color chairs options',
      price: '\$25.00',
      assetNAme: 'asset/images/sofa.png',
    ),
  ];
}

class BotNavClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(w, h * 0.3, w * 0.8, h * 0.3);
    path.lineTo(w * 0.2, h * 0.3);
    path.quadraticBezierTo(0, h * 0.3, 0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h * 0.5);
    path.quadraticBezierTo(0, h, w * 0.8, h);
    path.quadraticBezierTo(w, h, w, h * 0.8);
    path.lineTo(w, h * 0.15);
    path.quadraticBezierTo(w, 0, w * 0.85, 0);
    path.lineTo(w * 0.15, 0);
    path.quadraticBezierTo(0, 0, 0, h * 0.15);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
