import 'package:e_commerce/assets/provider/cart.dart';
import 'package:e_commerce/pages/check_out.dart';
import 'package:e_commerce/pages/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsAndPrice extends StatelessWidget {
  const ProductsAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
        final cart = Provider.of<Cart>(context);

    return  Row(
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: 22,
                      child: Container(
                        child: Text(
                          "${cart.selectedProducts.length}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.lightGreen),
                        padding: EdgeInsets.all(6),
                      ),
                    ),
                    IconButton(
                        onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOut(),
                      ),
                    );},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                // ignore: prefer_const_constructors
                Text(
                  "\$ ${cart.Price}",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )
        ;
  }
}