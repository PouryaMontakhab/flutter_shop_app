import 'package:flutter/material.dart';
import 'package:fourth_app/providers/cart.dart';

class OrdersItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrdersItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrdersItem> _orders = [];

  List<OrdersItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    if(!cartProducts.isEmpty){
_orders.insert(
        0,
        OrdersItem(
            id: DateTime.now().toString(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
    notifyListeners();
    }
    
  }
}
