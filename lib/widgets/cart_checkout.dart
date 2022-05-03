import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../resource/style_text.dart';
import '../pages/product/models/topping_model.dart';

class CartCheckoutItem extends StatelessWidget {
  final int id;
  final String image, name;
  final double price;
  final List<ToppingModel> listChoose;
  final int quantity;

  const CartCheckoutItem(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.listChoose,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Colors.white,
                      Colors.grey,
                    ],
                    begin: Alignment(0.0, -1),
                    end: Alignment(0.0, 0.6),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/" + image),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          name,
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          for (var item in listChoose)
                            Text(
                              item.name + ", ",
                              style: ConstantsText.descTitleStyle,
                            ),
                        ],
                      ),
                      Text(
                        "x " + quantity.toString() + " = " +NumberFormat.decimalPattern().format(price).toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
