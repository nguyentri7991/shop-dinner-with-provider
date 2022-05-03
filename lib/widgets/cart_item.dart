import 'package:flutter/material.dart';
import '../../../resource/style_text.dart';
import '../pages/product/models/topping_model.dart';

class CartItem extends StatelessWidget {
  final int id;
  final String image, name;
  final double price;
  final List<ToppingModel> listChoose;
  final int quantity;
  final Function() add, remove;

  const CartItem(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.add,
      required this.remove,
      required this.price,
      required this.listChoose,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:const BorderRadius.all(
          Radius.circular(16),
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
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
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
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          price.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: remove,
                                icon: Icon(
                                  Icons.remove,
                                  size: 24,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Container(
                                color: Colors.grey.shade200,
                                padding: const EdgeInsets.only(
                                    top: 2, bottom: 2, right: 8, left: 8),
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: add,
                                icon: Icon(
                                  Icons.add,
                                  size: 24,
                                  color: Colors.grey.shade700,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
