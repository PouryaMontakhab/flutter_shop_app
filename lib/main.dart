import 'package:flutter/material.dart';
import 'package:fourth_app/providers/cart.dart';
import 'package:fourth_app/providers/orders.dart';
import 'package:fourth_app/providers/product.dart';
import 'package:fourth_app/providers/products.dart';
import 'package:fourth_app/screens/cart_screen.dart';
import 'package:fourth_app/screens/order_screen.dart';
import 'package:fourth_app/screens/product_detail_screen.dart';
import 'package:fourth_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = new ThemeData();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Prodcuts()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),

      ],
      child: MaterialApp(
        theme: theme.copyWith(
            colorScheme: theme.colorScheme
                .copyWith(primary: Colors.purple, secondary: Colors.deepOrange),
            appBarTheme: theme.appBarTheme.copyWith(
                color: theme.colorScheme.primary,
                foregroundColor: Colors.white)),
        routes: {
          '/': (ctx) => ProductsOverviewScree(),
          ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.rounteName: (ctx) => OrderScreen()
        },
      ),
    );
  }
}
