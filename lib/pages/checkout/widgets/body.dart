import 'package:flutter/material.dart';
import '../../auth/provider/sign_in_pr.dart';
import '../../checkout/provider/store_pr.dart';
import '../../../helpers/api_order.dart';
import '../../checkout/provider/checkout_pr.dart';
import '../../cart/provider/cart_pr.dart';
import '../../../widgets/button_item.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_information.dart';
import '../widgets/payment_methods.dart';
import '../widgets/shipment_detail.dart';
import '../../products/products_page.dart';

class BodyCheckoutPage extends StatefulWidget {
  const BodyCheckoutPage({Key? key}) : super(key: key);

  @override
  _BodyCheckoutPageState createState() => _BodyCheckoutPageState();
}

class _BodyCheckoutPageState extends State<BodyCheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer4<CartProvider, CheckoutProvider, StoreProvider,
        SignInProvider>(builder: (context, cart, checkout, store, signIn, child) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const ShipmentDetail(),
                const SizedBox(height: 15),
                const PaymentMethods(),
                const SizedBox(height: 15),
                const CartInformation(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      CustomButton(
                        buttonName: 'Đặt hàng'.toUpperCase(),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            OrderService.orderPost(
                              cart.totalPriceCart,
                              signIn.getAuthModel!.id,
                              store.getStoreModel!.id,
                              checkout.getAddress,
                              checkout.getReceiver,
                              cart.cartListItem,
                            );
                            cart.clearCart();
                            checkout.setClearTextField();
                            Navigator.pop(context);
                          }
                        },
                        buttonColor: Colors.orangeAccent.withOpacity(0.6),
                        borderColor: Colors.orangeAccent,
                        buttonHeight: 0.09,
                        buttonWidth: 0.6,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        buttonName: 'Tiếp tục mua hàng'.toUpperCase(),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShopPage(),
                          ),
                        ),
                        buttonColor: Colors.white,
                        borderColor: Colors.orangeAccent.withOpacity(0.7),
                        buttonHeight: 0.09,
                        buttonWidth: 0.6,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
