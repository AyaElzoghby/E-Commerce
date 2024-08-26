import 'package:e_commerce/widgets/Actions.dart';
import 'package:e_commerce/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Details extends StatefulWidget {
  Product item;

  Details({super.key, required this.item});
  @override
  State<Details> createState() => _DetailsState();
}

bool isShowMore = true;

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Product Details",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          actions: [ProductsAndPrice()
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      widget.item.Pro_img,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 0.25,
                      height: 300,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "\$ ${widget.item.Price}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text("NEW",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              )),
                          padding: EdgeInsets.all(5),
                          color: Colors.red[300],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 26,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 26,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 26,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 26,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 26,
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 26,
                        ),
                        Text(
                          "Plants House",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Details:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.item.Info,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                    maxLines: isShowMore ? 3 : null,
                    overflow: TextOverflow.fade,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isShowMore = !isShowMore;
                      });
                    },
                    child: Text(
                      isShowMore ? "Show More" : "Show Less",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
