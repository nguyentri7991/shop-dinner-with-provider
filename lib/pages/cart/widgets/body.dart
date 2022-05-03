import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../products/products_page.dart';
import '../../cart/provider/cart_pr.dart';
import '../../../resource/style_text.dart';
import '../../../widgets/cart_item.dart';

class BodyCart extends StatefulWidget {
  const BodyCart({Key? key}) : super(key: key);

  @override
  _BodyCartState createState() => _BodyCartState();
}

class _BodyCartState extends State<BodyCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return cart.amountItem == 0
          ? Expanded(
              child: Center(
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const ShopPage(),
                    ),
                  ),
                  child: Text(
                    "Giỏ hàng trống! Click vào để đi tới cửa hàng",
                    style: ConstantsText.titleStyle,
                  ),
                ),
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: cart.amountItem,
                itemBuilder: (context, index) => CartItem(
                  id: cart.cartListItem[index].id,
                  image: cart.cartListItem[index].productImage,
                  name: cart.cartListItem[index].productName,
                  add: () => cart.increase(cart.cartListItem[index]),
                  remove: () => cart.decrease(cart.cartListItem[index]),
                  price: cart.cartListItem[index].price *
                      cart.cartListItem[index].quantity,
                  listChoose: cart.cartListItem[index].listTopping,
                  quantity: cart.cartListItem[index].quantity,
                ),
              ),
            );
    });
  }
}
