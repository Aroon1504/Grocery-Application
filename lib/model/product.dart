//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "images";
  static const PRICE = "price";

  // static const DESCRIPTION = "description";
  static const CATEGORY = "category";

  // static const FEATURED = "featured";
  static const QUANTITY = "quantity";
  static const BRAND = "brand";

  // static const SALE = "sale";
  static const WEIGHT = "weight";

  // static const COLORS = "colors";

  String _id;
  String _name;
  List _picture;
  String _description;
  String _category;
  String _brand;
  int _quantity;
  int _price;
  bool _sale;
  bool _featured;
  List _colors;
  List _weight;

  String get id => _id;

  String get name => _name;

  List get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  String get description => _description;

  int get quantity => _quantity;

  int get price => _price;

  bool get featured => _featured;

  bool get sale => _sale;

  List get colors => _colors;

  List get weight => _weight;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get(ID);
    _brand = snapshot.get(BRAND);
    // _sale = snapshot.get(SALE);
    // _description = snapshot.get(DESCRIPTION) ?? " ";
    // _featured = snapshot.get(FEATURED);
    _price = snapshot.get(PRICE).floor();
    _category = snapshot.get(CATEGORY);
    // _colors = snapshot.get(COLORS);
    _weight = snapshot.get(WEIGHT);
    _name = snapshot.get(NAME);
    _picture = snapshot.get(PICTURE);
  }
}
