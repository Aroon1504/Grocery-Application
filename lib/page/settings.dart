//@dart=2.9

import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/page/order.dart';
import 'package:grocery/page/profile.dart';
import 'package:grocery/widgets/custom_text.dart';
import 'cart.dart';
import 'package:rolling_switch/rolling_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool toggleValue = true;
  String notstat = "on";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0,
        iconTheme: const IconThemeData(color: white),
        title: CustomText(
          text: "Settings",
          size: 27,
          color: white,
          weight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            InkWell(
              onTap: () {
                changeScreen(context, ProfilePage());
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.person,
                    color: green,
                  ),
                  title: Text("My Profile"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(
                  Icons.notifications_outlined,
                  color: green,
                ),
                title: Text("Notification"),
                trailing: Switch(
                  value: toggleValue,
                  onChanged: (bool e) async {
                    fun(e);
                    await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      elevation: 100,
                      content: Text("Notifcation is now ${notstat}",textAlign: TextAlign.center,style: TextStyle(color: black),),
                      duration: Duration(milliseconds: 350),
                      backgroundColor: Colors.white10,
                    ));
                  },
                  activeColor: green,
                  inactiveThumbColor: redAccent,
                  inactiveTrackColor: Colors.redAccent[100],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                changeScreen(context, const CartScreen());
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: green,
                  ),
                  title: Text("Cart"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                changeScreen(context, OrdersScreen());
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.shopping_basket,
                    color: green,
                  ),
                  title: Text("My Order"),
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

  fun(bool e) {
    setState(() {
      toggleValue = !toggleValue;
      notstat = toggleValue ? "on" : "off";
    });
  }
}
