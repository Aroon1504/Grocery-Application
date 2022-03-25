//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/provider/app.dart';
import 'package:grocery/provider/user_provider.dart';
import 'package:grocery/widgets/custom_text.dart';
import 'package:grocery/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'cart.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  // final product_detail_name;
  // final product_detail_new_price;
  // final product_detail_old_price;
  // final product_detail_picture;
  //
  // ProductDetails(
  //     {this.product_detail_name,
  //     this.product_detail_new_price,
  //     this.product_detail_old_price,
  //     this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
  String _color = "";
  String _weight = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _weight = widget.product.weight[0];
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      body: SafeArea(
          child: Container(
        color: Colors.black.withOpacity(0.9),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.center,
                  child: Loading(),
                )),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.product.picture[0],
                    fit: BoxFit.fill,
                    height: 400,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container())),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container())),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              widget.product.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Rs.${widget.product.price}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  right: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        changeScreen(context, CartScreen());
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.shopping_cart),
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        print("CLICKED");
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(35))),
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 5),
                          blurRadius: 10)
                    ]),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomText(
                              text: "Select a Weight",
                              color: white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton<String>(
                                value: _weight,
                                style: TextStyle(color: white),
                                items: widget.product.weight
                                    .map<DropdownMenuItem<String>>(
                                        (value) => DropdownMenuItem(
                                            value: value,
                                            child: CustomText(
                                              text: value,
                                              color: red,
                                            )))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _weight = value;
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Description:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s  Lorem Ipsum has been the industry standard dummy text ever since the 1500s ',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Material(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () async {
                              appProvider.changeIsLoading();
                              bool success = await userProvider.addToCart(
                                  product: widget.product,
                                  weight: _weight);
                              if (success) {
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Added to Cart!")));
                                userProvider.reloadUserModel();
                                appProvider.changeIsLoading();
                                return;
                              } else {
                                _key.currentState.showSnackBar(SnackBar(
                                    content: Text("Not added to Cart!")));
                                appProvider.changeIsLoading();
                                return;
                              }
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: appProvider.isLoading
                                ? Loading()
                                : Text(
                                    "Add to cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

// class Similar_products extends StatefulWidget {
//   @override
//   _Similar_productsState createState() => _Similar_productsState();
// }
//
// class _Similar_productsState extends State<Similar_products> {
//   var product_list = [
//     {
//       "name": "Milk Chocolate",
//       "picture": "assets/images/img-13.jpg",
//       "old_price": 150,
//       "price": 60,
//     },
//     {
//       "name": "Yellow Mustard",
//       "picture": "assets/images/img-14.jpg",
//       "old_price": 1250,
//       "price": 700,
//     },
//     {
//       "name": "Olive Oil",
//       "picture": "assets/images/img-16.jpg",
//       "old_price": 2000,
//       "price": 1500,
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: product_list.length,
//         gridDelegate:
//             new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return Similar_Single_prod(
//             prod_name: product_list[index]['name'],
//             prod_pricture: product_list[index]['picture'],
//             prod_old_price: product_list[index]['old_price'],
//             prod_price: product_list[index]['price'],
//           );
//         });
//   }
// }

// class Similar_Single_prod extends StatelessWidget {
//   final prod_name;
//   final prod_pricture;
//   final prod_old_price;
//   final prod_price;
//
//   Similar_Single_prod({
//     this.prod_name,
//     this.prod_pricture,
//     this.prod_old_price,
//     this.prod_price,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Hero(
//           tag: prod_name,
//           child: Material(
//             child: InkWell(
//               onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                   builder: (context) => new ProductDetails(
//                         product_detail_name: prod_name,
//                         product_detail_new_price: prod_price,
//                         product_detail_old_price: prod_old_price,
//                         product_detail_picture: prod_pricture,
//                       ))),
//               child: GridTile(
//                   footer: Container(
//                       color: Colors.white70,
//                       child: new Row(
//                         children: <Widget>[
//                           Expanded(
//                               child: Text(
//                             prod_name,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16.0),
//                           )),
//                           new Text(
//                             "\$${prod_price}",
//                             style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold),
//                           )
//                         ],
//                       )),
//                   child: Image.asset(
//                     prod_pricture,
//                     fit: BoxFit.cover,
//                   )),
//             ),
//           )),
//     );
//   }
// }
