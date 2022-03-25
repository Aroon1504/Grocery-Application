import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Milk Chocolate",
      "picture": "assets/images/img-13.jpg",
      "price": 60,
      "size": "Small",
      "flavour": "Chocolate",
      "Quantity": 1,
    },
    {
      "name": "Peanut Butter",
      "picture": "assets/images/img-12.png",
      "price": 500,
      "size": "Medium",
      "flavour": "Peanut",
      "Quantity": 1,
    },
    {
      "name": "Peanut Butter",
      "picture": "assets/images/img-12.png",
      "price": 500,
      "size": "Medium",
      "flavour": "Peanut",
      "Quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_flavour: Products_on_the_cart[index]["flavour"],
            cart_prod_qty: Products_on_the_cart[index]["Quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_flavour;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_flavour,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: new Image.asset(
            cart_prod_picture,
            width: 80.0,
            height: 80.0,
          ),
          title: new Text(
            cart_prod_name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text(
                      "Size:",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_size,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.3),
                    child: new Text(
                      "Flavour: ",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text(
                      cart_prod_flavour,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              new Container(
                alignment: Alignment.topLeft,
                child: new Text(
                  "\$${cart_prod_price}",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
          trailing: new Column(
            children: [
              InkWell(
                child: new Icon(
                  Icons.arrow_drop_up,
                ),
                onTap: () {},
              ),
              Expanded(
                child: new Text(
                  "$cart_prod_qty",
                  style: new TextStyle(fontSize: 10),
                ),
              ),
              InkWell(
                  child: Icon(
                    Icons.arrow_drop_down,
                  ),
                  onTap: () {}),
            ],
          )),
    );
  }
}
