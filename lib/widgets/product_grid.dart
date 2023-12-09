import 'package:flutter/material.dart';
import 'package:fourth_app/providers/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;
  ProductGrid({required this.showFav});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Prodcuts>(context);
    var products = showFav ? productProvider.GetAllFavorites : productProvider.getItems;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value:products[index],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
