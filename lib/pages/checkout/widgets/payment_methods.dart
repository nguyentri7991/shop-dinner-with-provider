import 'package:flutter/material.dart';
import '../../../resource/style_text.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Phương thức thanh toán",
            style: ConstantsText.titleStyle,
          ),
          const SizedBox(height: 10),
          Container(
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
            child: Row(
              children: const [
                SizedBox(width: 5),
                Icon(
                  Icons.circle,
                  size: 13,
                  color: Colors.amberAccent,
                ),
                SizedBox(width: 10),
                Text("Thanh toán khi nhận hàng"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
