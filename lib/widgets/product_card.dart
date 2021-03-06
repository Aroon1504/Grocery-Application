//@dart=2.9

import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/page/product_details.dart';
import 'package:grocery/page/splash.dart';
import 'package:transparent_image/transparent_image.dart';

import 'custom_text.dart';
import 'loading.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          changeScreen(
              context,
              ProductDetails(
                product: product,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(-2, -1),
                  blurRadius: 5),
            ]
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: Loading(),
                      )),
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: product.picture[0],
                          fit: BoxFit.cover,
                          height: 140,
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${product.name} \n',
                    style: TextStyle(fontSize: 20),
                  ),
                  TextSpan(
                    text: 'by: ${product.brand} \n\n\n\n',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'Rs.${product.price} \t',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  // TextSpan(
                  //   text: product.sale ? 'ON SALE ' : "",
                  //
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.red),
                  // ),
                ],
                    style: TextStyle(color: Colors.black)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _productImage(String picture) {
    if (picture == null) {
      return Container(
        child: CustomText(text: "No Image"),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            product.picture[0],
            height: 140,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
