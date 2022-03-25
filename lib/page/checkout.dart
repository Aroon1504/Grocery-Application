//@dart=2.9

import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            InkWell(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.paypal,
                    color: green,
                  ),
                  title: Text("Paypal"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.googlePay,
                    color: green,
                  ),
                  title: Text("G Pay"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.amazonPay,
                    color: green,
                  ),
                  title: Text("Amazon Pay"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.applePay,
                    color: green,
                  ),
                  title: Text("Apple Pay"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.ccVisa,
                    color: green,
                  ),
                  title: Text("Card"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
    );
  }
}
