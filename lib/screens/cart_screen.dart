import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fourth_app/providers/cart.dart';
import 'package:fourth_app/providers/orders.dart';
import 'package:fourth_app/providers/products.dart';
import 'package:fourth_app/screens/order_screen.dart';
import 'package:fourth_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/carts_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Prodcuts>(context, listen: false);
    var cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Your cart')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Consumer<Cart>(
                              builder: (_, cart, child) => Text(
                                '\$${cart.totalAmount}',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(cart.getItems.values.toList(),
                                    cart.totalAmount);
                            cart.clear();
                            Navigator.of(context)
                                .pushNamed(OrderScreen.rounteName);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent),
                          child: Text('ORDER NOW'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.all(10),
              child: Consumer<Cart>(
                builder: (_, cart, child) => ListView.builder(
                  itemBuilder: (context, index) => CartsItem(
                      productId: cart.getItems.keys.toList()[index],
                      id: cart.getItems.values.toList()[index].id,
                      title: cart.getItems.values.toList()[index].title,
                      price: cart.getItems.values.toList()[index].price,
                      quantity: cart.getItems.values.toList()[index].quantity),
                  itemCount: cart.itemsCount,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
