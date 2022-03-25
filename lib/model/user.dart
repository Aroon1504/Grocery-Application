//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_item.dart';

class UserModel {
  static const ID = "userId";
  static const NAME = "name";
  static const EMAIL = "email";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";
  static const PHONE = 'phone';


  String _name;
  String _email;
  String _id;
  String _stripeId;
  int _priceSum = 0;
  int _phone = 0;

//  getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get stripeId => _stripeId;

  int get phone =>_phone;

  // public variables
  List<CartItemModel> cart;
  int totalCartPrice;



  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.get(NAME);
    _email = snapshot.get(EMAIL);
    _id = snapshot.get(ID);
    _stripeId = snapshot.get(STRIPE_ID) ?? "";
    cart = _convertCartItems(snapshot.get(CART)?? []);
    totalCartPrice = snapshot.get(CART) == null ? 0 :getTotalPrice(cart: snapshot.get(CART));
  }

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  int getTotalPrice({List cart}){
    if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["price"];
    }

    int total = _priceSum;
    return total;
  }
  getProfile() {
    return {
      name:_name,
      email:_email,
    };
  }
  add_phone(){

  }
}