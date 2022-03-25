//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/model/cart_item.dart';
import 'package:grocery/model/user.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String ref="users";
  createUser(Map<String,dynamic> value) async {
    try {
      await _firestore.collection(ref).doc(value['userId']).set(value);
      print("User was created");
    }
    catch(e){
      print("Error : ${e.toString()}");
    }
  }
  Future<UserModel> getUserById(String id)=> _firestore.collection(ref).doc(id).get().then((doc){
    print("==========id is $id=============");
    debugPrint("==========NAME is ${doc.get('name')}=============");
    debugPrint("==========NAME is ${doc.get('name')}=============");
    debugPrint("==========NAME is ${doc.get('name')}=============");
    debugPrint("==========NAME is ${doc.get('name')}=============");

    print("==========NAME is ${doc.get('name')}=============");
    print("==========NAME is ${doc.get('name')}=============");
    print("==========NAME is ${doc.get('name')}=============");


    return UserModel.fromSnapshot(doc);
  });
  void addToCart({String userId, CartItemModel cartItem}){
    _firestore.collection(ref).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}){
    _firestore.collection(ref).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
  void add_phone({String userId, int phone}){
    _firestore.collection(ref).doc(userId).update({
      'phone': phone
    });
  }
}
