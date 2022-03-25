// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:grocery/auth/login.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/page/about.dart';
import 'package:grocery/page/cart.dart';
import 'package:grocery/components/horizontal_listview.dart';
import 'package:grocery/page/product_search.dart';
import 'package:grocery/page/profile.dart';
import 'package:grocery/page/settings.dart';
import 'package:grocery/provider/product.dart';
import 'package:grocery/provider/user_provider.dart';
import 'package:grocery/widgets/custom_text.dart';
import 'package:grocery/widgets/feature_products.dart';
import 'package:grocery/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:grocery/page/order.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    // Widget image_carousel = Container(
    //   height: 220.0,
    //   child: Carousel(
    //     boxFit: BoxFit.cover,
    //     images: const [
    //       AssetImage('assets/images/img-1.jpg'),
    //       AssetImage('assets/images/img-2.jpg'),
    //       AssetImage('assets/images/img-3.jpg'),
    //       AssetImage('assets/images/img-4.jpg'),
    //     ],
    //     autoplay: true,
    //     animationCurve: Curves.fastOutSlowIn,
    //     animationDuration: Duration(milliseconds: 1000),
    //     dotSize: 4.0,
    //     indicatorBgPadding: 6.0,
    //     dotBgColor: Colors.transparent,
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: green,
        title: CustomText(
          text: "Grocery",
          size: 27,
          color: white,
          weight: FontWeight.w500,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              changeScreen(context, CartScreen());
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.userModel?.name ?? 'username..loading'),
              accountEmail: Text(user.userModel?.email ?? 'email..loading'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                    color: white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(color: green),
            ),
            InkWell(
              onTap: () {
                changeScreen(context, ProfilePage());
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text("User profile")));
              },
              child: const ListTile(
                title: Text('My account'),
                leading: Icon(
                  Icons.person,
                  color: lightgreen,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              child: const ListTile(
                title: Text('My orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: lightgreen,
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => new Cart()));
            //   },
            //   child: const ListTile(
            //     title: Text('Shopping Cart'),
            //     leading: Icon(
            //       Icons.shopping_cart_outlined,
            //       color: lightgreen,
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: const ListTile(
            //     title: Text('Favourites'),
            //     leading: Icon(
            //       Icons.favorite,
            //       color: lightgreen,
            //     ),
            //   ),
            // ),
            const Divider(),
            InkWell(
              onTap: () {
                changeScreen(context, SettingsPage());
              },
              child: const ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: green,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                changeScreen(context, AboutPage());
              },
              child: const ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.info_outline,
                  color: green,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                user.signOut();
              },
              child: const ListTile(
                title: Text('Sign out'),
                leading: Icon(
                  Icons.exit_to_app,
                  color: green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: black,
                      ),
                      title: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (pattern) async {
                          await productProvider.search(productName: pattern);
                          changeScreen(context, ProductSearchScreen());
                        },
                        decoration: InputDecoration(
                          hintText: "blazer, dress...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // image_carousel,

              //Featured Product
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: new Text('Featured products')),
                  ),
                ],
              ),
              FeaturedProducts(),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recent products',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
              Column(
                children: productProvider.products
                    .map((item) => GestureDetector(
                          child: ProductCard(
                            product: item,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
