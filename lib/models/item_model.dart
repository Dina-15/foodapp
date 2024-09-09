import 'dart:ffi';

class ItemModel {
  String image;
  String name;
  String details;
  double spicy = 0.6;
  int portion = 2;
  double price;
  double rate;
  ItemModel(
      {required this.image,
      required this.name,
      required this.rate,
      required this.details,
      required this.price});

  factory ItemModel.fromJson(json) {
    return ItemModel(
        image: json['image'],
        name: json['name'],
        rate: json['rate'],
        details: json['details'],
        price: json['price']);
  }
}
