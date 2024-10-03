import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? image;
  @HiveField(2)
  int? quantity;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? description;
  @HiveField(5)
  double? price;
  CartModel(
      {this.id,
      this.image,
      this.quantity,
      this.name,
      this.description,
      this.price});
}
