import 'package:e_commerce/assets/colors.dart';
import 'package:e_commerce/widgets/Actions.dart';
import 'package:e_commerce/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/assets/provider/cart.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CheckOut"),
          actions: [ProductsAndPrice()],
        ),
        body: Stack(
          children: [
            SizedBox(
              child: ListView.builder(
                  itemCount: cart.selectedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child:
                              Image.asset(cart.selectedProducts[index].Pro_img),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            cart.delete(cart.selectedProducts[index]);
                          },
                        ),
                        title: Text(cart.selectedProducts[index].Name),
                        subtitle: Text(
                          "\$ ${cart.selectedProducts[index].Price} , ${cart.selectedProducts[index].Info}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }),
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 70,
                  left: 0,
                  right: 0,
                  child: Align(
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Pay \$${cart.Price}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Green),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 90,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(10, 255, 255, 255),
                              Color.fromARGB(200, 255, 255, 255),
                              Colors.white,
                            ],
                          ),
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
