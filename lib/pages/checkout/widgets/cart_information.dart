import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../cart/provider/cart_pr.dart';
import '../../../widgets/cart_checkout.dart';
import 'package:provider/provider.dart';
import '../../../resource/style_text.dart';

class CartInformation extends StatefulWidget {
  const CartInformation({Key? key}) : super(key: key);

  @override
  _CartInformationState createState() => _CartInformationState();
}

class _CartInformationState extends State<CartInformation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thông tin đơn hàng",
              style: ConstantsText.titleStyle,
            ),
            const SizedBox(height: 10),
            Container(
              height: cart.amountItem <= 3 ? 200:400,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: cart.amountItem,
                itemBuilder: (context, index) => CartCheckoutItem(
                  id: cart.cartListItem[index].id,
                  image: cart.cartListItem[index].productImage,
                  name: cart.cartListItem[index].productName,
                  price: cart.cartListItem[index].price *
                      cart.cartListItem[index].quantity,
                  listChoose: cart.cartListItem[index].listTopping,
                  quantity: cart.cartListItem[index].quantity,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Phí Ship: 0"),
                const SizedBox(height: 5),
                Text(
                  'Tổng: ' + NumberFormat.decimalPattern().format(cart.totalPriceCart).toString(),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
