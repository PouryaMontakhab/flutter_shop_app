import 'package:flutter/material.dart';
import 'package:fourth_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static const routName = 'productDetail';
  @override
  Widget build(BuildContext context) {
    var productId = ModalRoute.of(context)?.settings.arguments as String;
    var productItem =
        Provider.of<Prodcuts>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productItem.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 300,
              width: double.infinity,
              child: Image.network(productItem.imageUrl)),
          SizedBox(
            height: 20,
          ),
          Text(
            '\$${productItem.price}',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              '${productItem.title} - ${productItem.description}',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
