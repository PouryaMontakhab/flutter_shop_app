import 'package:flutter/material.dart';
import 'package:fourth_app/providers/cart.dart';
import 'package:fourth_app/providers/product.dart';
import 'package:fourth_app/providers/products.dart';
import 'package:provider/provider.dart';

class CartsItem extends StatelessWidget {
  final String productId;
  final String title;
  final String id;
  final double price;
  final int quantity;
  const CartsItem(
      {required this.productId,
      required this.id,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    var products = Provider.of<Prodcuts>(context, listen: false);

    return Dismissible(
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          cart.removeItem(productId);
        } else {
          var product = products.findById(productId);
          product.toggleFavorite();
        }
      },
      secondaryBackground: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(10)
        ),
        alignment: Alignment.centerRight,
        
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            )),
      ),
      background: Container(
        alignment: Alignment.centerLeft,
         decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.archive_rounded,
              color: Colors.white,
              size: 40,
            )),
      ),
      key: ValueKey(id),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(child: Text('\$${price}')),
          title: Text(
            '$title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('total: \$${price * quantity}'),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
