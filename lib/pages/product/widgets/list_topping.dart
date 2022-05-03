import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../resource/style_text.dart';
import '../../../helpers/api_topping.dart';
import '../provider/topping_pr.dart';
import '../../cart/provider/cart_pr.dart';

class ToppingList extends StatefulWidget {
  const ToppingList({Key? key}) : super(key: key);

  @override
  _ToppingListState createState() => _ToppingListState();
}

class _ToppingListState extends State<ToppingList> {
  _getToppings() async {
    var provider = Provider.of<ToppingProvider>(context, listen: false);
    var response = await ToppingService.getToppings();
    if (response.isSuccessful!) {
      provider.setToppingList(response.data!);
    } else {
      // ignore: avoid_print
      print(response.message!);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    _getToppings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ToppingProvider, CartProvider>(
      builder: (context, topping, cart, child) => topping.isProcessing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: topping.toppingList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      title: Text(
                        topping.toppingList[index].name,
                        style: ConstantsText.secondTitleText,
                      ),
                      subtitle: Text(
                        NumberFormat("#,##,000")
                            .format(topping.toppingList[index].price)
                            .toString(),
                        style: ConstantsText.secondDescTitleStyle,
                      ),
                      // ignore: iterable_contains_unrelated_type
                      value: topping.selectToppingList
                          .contains(topping.getToppingIndex(index)),
                      onChanged: (bool? value) {
                        if (value!) {
                          topping.addTopping(topping.getToppingIndex(index));
                        } else {
                          topping.removeTopping(topping.getToppingIndex(index));
                        }
                      },
                    );
                  },
                ),
              ),
            ),
    );
  }
}
