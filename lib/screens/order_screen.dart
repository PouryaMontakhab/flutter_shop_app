import 'package:flutter/material.dart';
import 'package:fourth_app/providers/orders.dart';
import 'package:fourth_app/widgets/order_item.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const rounteName = 'order_screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your cart')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            OrderItem(order: orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
