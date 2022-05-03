import 'package:flutter/material.dart';
import '../pages/auth/provider/sign_up_pr.dart';
import '../pages/home/provider/promotion_pr.dart';
import '../pages/auth/provider/sign_in_pr.dart';
import '../pages/checkout/provider/checkout_pr.dart';
import '../pages/checkout/provider/store_pr.dart';
import '../pages/product/provider/product_size_pr.dart';
import '../pages/product/provider/detail_product_pr.dart';
import '../pages/product/provider/topping_pr.dart';
import '../pages/products/provider/product_pr.dart';
import '../pages/cart/provider/cart_pr.dart';
import 'package:provider/provider.dart';
import '../pages/home/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ToppingProvider()),
        ChangeNotifierProvider(create: (_) => SizeProvider()),
        ChangeNotifierProvider(create: (_) => DetailProductProvider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => StoreProvider()),
        ChangeNotifierProvider(create: (_) => PromotionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinner Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
