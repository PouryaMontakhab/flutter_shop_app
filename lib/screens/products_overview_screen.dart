import 'package:flutter/material.dart';
import 'package:fourth_app/providers/cart.dart';
import 'package:fourth_app/screens/cart_screen.dart';
import 'package:fourth_app/widgets/app_drawer.dart';
import 'package:fourth_app/widgets/product_grid.dart';
import 'package:fourth_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../widgets/CustomBadge.dart';

enum FilterOption { Favorites, All }

class ProductsOverviewScree extends StatefulWidget {
  const ProductsOverviewScree({super.key});

  @override
  State<ProductsOverviewScree> createState() => _ProductsOverviewScreeState();
}

class _ProductsOverviewScreeState extends State<ProductsOverviewScree> {
  bool _showFovoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop now'),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOption selectedValue) {
                setState(() {
                  if (selectedValue == FilterOption.Favorites) {
                    _showFovoritesOnly = true;
                  } else {
                    _showFovoritesOnly = false;
                  }
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Only favorites'),
                  value: FilterOption.Favorites,
                ),
                PopupMenuItem(
                  child: Text('All'),
                  value: FilterOption.All,
                )
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => CustomBadge(
                child: ch!,
                value: cart.itemsCount.toString(),
              ),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  }),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ProductGrid(
          showFav: _showFovoritesOnly,
        ));
  }
}
