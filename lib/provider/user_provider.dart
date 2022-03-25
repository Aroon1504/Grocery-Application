//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/model/cart_item.dart';
import 'package:grocery/model/order.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/services/order.dart';
import 'package:grocery/services/users.dart';
import 'package:uuid/uuid.dart';

enum Status { home,splash,Uninitialized, Authenticated, Authenticating, Unauthenticated ,SignUp}

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();

  UserModel _userModel;

  // getter
  UserModel get userModel => _userModel;

  Status get status => _status;

  User get user => _user;

  //public variables
  List<OrderModel> orders = [];

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onStatusChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        _userModel = await _userServices.getUserById(value.user.uid);
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        print("Create User");
        _userServices.createUser({
          'name': name,
          'email': email,
          'userId': user.user.uid,
          'stripeId': '',
          'cart': [],
        });
        _userModel = await _userServices.getUserById(user.user.uid);
        _status = Status.Authenticated;
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStatusChanged(User user) async {
    await Future.delayed(Duration(seconds: 3),(){});
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart({ProductModel product, String weight}) async {
    try {
      var uuid = Uuid();
      String cartItemId = uuid.v4();
      List<CartItemModel> cart = _userModel.cart;

      Map cartItem = {
        "id": cartItemId,
        "name": product.name,
        "image": product.picture[0],
        "productId": product.id,
        "price": product.price,
        "weight": weight,
      };

      CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
      print("CART ITEMS ARE: ${cart.toString()}");
      _userServices.addToCart(userId: _user.uid, cartItem: item);
//      }

      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromCart({CartItemModel cartItem}) async {
    print("THE PRODUCT IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }
  Future<bool> add_phone (int phone) async {
    print("THE PRODUCT IS: ${phone}");

    try {
      _userServices.add_phone(userId: _user.uid, phone: phone);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user.uid);
    notifyListeners();
  }

  signup() {
    _status = Status.SignUp;
    notifyListeners();
  }
  Splash(){
    _status =Status.splash;
    notifyListeners();
  }
  HomeScreen(){
    _status = Status.Authenticated;
    notifyListeners();
  }
}
