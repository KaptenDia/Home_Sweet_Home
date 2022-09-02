import 'package:home_sweet_home/models/product_model.dart';

class CartModel {
  int id;
  Product product;
  int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  num getTotalPrice() {
    return product.price * quantity;
  }
}
