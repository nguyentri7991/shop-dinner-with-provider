import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resource/style_text.dart';
import '../../cart/provider/cart_pr.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_downward_sharp),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Giỏ hàng của tôi".toUpperCase(),
                style: ConstantsText.sectionTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextButton(
                onPressed: () => cart.clearCart(),
                child: Text(
                  "Xóa tất cả",
                  style: ConstantsText.descTitleStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
