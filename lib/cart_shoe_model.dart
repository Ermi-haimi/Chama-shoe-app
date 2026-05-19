import 'package:chama_chama/shoe_model.dart';

class CartShoeModel {
  Shoe shoe;
  String size;
  int quantity;

  CartShoeModel({
    required this.shoe,
    required this.size,
    this.quantity = 1,
  });
}
