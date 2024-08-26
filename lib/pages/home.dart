// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers

import 'package:e_commerce/assets/provider/cart.dart';
import 'package:e_commerce/pages/check_out.dart';
import 'package:e_commerce/pages/details.dart';
import 'package:e_commerce/widgets/Actions.dart';
import 'package:e_commerce/widgets/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "lib/assets/images/background.jpeg"),
                                fit: BoxFit.cover)),
                        accountName: Text("Aya Elzoghby"),
                        accountEmail: Text("Aya@123"),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage:
                              AssetImage("lib/assets/images/image.jpeg"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text("home",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        leading: Icon(Icons.home),
                        onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );},
                      ),
                      ListTile(
                        title: Text("My Products",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        leading: Icon(Icons.shopping_cart),
                        onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOut(),
                      ),
                    );},
                      ),
                      ListTile(
                        title: Text("About",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        leading: Icon(Icons.library_books),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("Leave",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                        leading: Icon(Icons.arrow_back),
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: Text("All Rights saved for AAAAAAA"),
                padding: EdgeInsets.symmetric(vertical: 10),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Home",
            
          ),
          actions: [ProductsAndPrice()
            ],
        ),
        body: GridView.builder(
            itemCount: Products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(item: Products[index]),
                      ),
                    );
                  },
                  child: GridTile(
                      footer: GridTileBar(
                          trailing: Text(
                            "\$ ${Products[index].Price}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          title: Text(""),
                          leading:
                              Consumer<Cart>(builder: (context, cart, child) {
                            return IconButton(
                              onPressed: () {
                                cart.add(Products[index]);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 22,
                              ),
                            );
                          })),
                      child: Stack(children: [
                        Positioned(
                          right: 10,
                          left: 10,
                          top: 10,
                          child: ClipRRect(
                            child: Image.asset(
                              Products[index].Pro_img,
                              fit: BoxFit.cover,
                              height: 180,
                              width: 200,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ])),
                ),
              );
            }),
      ),
    );
  }
}
