import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../auth/sign_in_page.dart';
import '../../auth/provider/sign_in_pr.dart';
import 'package:provider/provider.dart';
import '../../cart/provider/cart_pr.dart';
import '../../cart/cart_page.dart';
import '../../checkout/checkout_page.dart';

class BottomNavigationShopPage extends StatefulWidget {
  const BottomNavigationShopPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationShopPageState createState() =>
      _BottomNavigationShopPageState();
}

class _BottomNavigationShopPageState extends State<BottomNavigationShopPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, SignInProvider>(
        builder: (context, cart, signIn, child) {
      return SizedBox(
        height: 55,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showCartModel(context);
                },
                child: Row(
                  children: [
                    const Icon(Icons.local_activity),
                    const Text("x"),
                    Text(
                      cart.qtyCartItem.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text("="),
                    Text(
                      NumberFormat.decimalPattern()
                          .format(cart.totalPriceCart)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  if (cart.cartListItem.isNotEmpty &&
                      signIn.isProcessing == false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckOutPage(),
                        ));
                  } else if (cart.cartListItem.isNotEmpty &&
                      signIn.isProcessing) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ));
                  }
                },
                child: const Text("Thanh Toán"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.brown.withOpacity(0.8),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Colors.brown.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
