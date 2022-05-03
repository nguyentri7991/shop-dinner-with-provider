import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../resource/style_text.dart';
import '../../resource/mq.dart';
import '../pages/product/product_page.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final int price;
  final double sale;

  const ProductItem(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.sale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MQuery.width! * 0.3,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          showDialogFunc(context, id);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Image.asset("assets/" + image),
              ),
              Text(
                name,
                style: ConstantsText.titleStyle,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sale == 0
                      ? Text(
                          NumberFormat("#,##,000").format(price).toString(),
                          style: ConstantsText.priceTextStyle,
                        )
                      : Row(
                          children: [
                            Text(
                              NumberFormat.decimalPattern()
                                  .format(price - (sale / 100 * price))
                                  .toString(),
                              style: ConstantsText.priceTextStyle,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              NumberFormat("#,##,000").format(price).toString(),
                              style: ConstantsText.descPriceTextStyle,
                            ),
                          ],
                        ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
