import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../resource/style_text.dart';
import '../../../resource/mq.dart';
import '../../../helpers/api_detail_product_size.dart';
import '../../../helpers/api_product.dart';
import '../../cart/provider/cart_pr.dart';
import '../provider/product_size_pr.dart';
import '../provider/detail_product_pr.dart';
import '../provider/topping_pr.dart';
import '../models/detail_product_size_model.dart';

class HearDetail extends StatefulWidget {
  final int? productId;

  const HearDetail({Key? key, this.productId}) : super(key: key);

  @override
  State<HearDetail> createState() => _HearDetailState();
}

class _HearDetailState extends State<HearDetail> {
  _getProduct() async {
    var provider = Provider.of<DetailProductProvider>(context, listen: false);
    var response = await ProductService.getProduct(widget.productId);
    if (response.isSuccessful!) {
      provider.setDetailProduct(response.data!);
    } else {
      // ignore: avoid_print
      print(response.message!);
    }
    provider.setIsProcessing(false);
  }

  _getSizes() async {
    var provider = Provider.of<SizeProvider>(context, listen: false);
    var response = await SizeService.getSizes(widget.productId);
    if (response.isSuccessful!) {
      provider.setSizeList(response.data!);
    } else {
      // ignore: avoid_print
      print(response.message!);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    _getProduct();
    _getSizes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<ToppingProvider, DetailProductProvider, SizeProvider,
        CartProvider>(
      builder: (context, topping, product, size, cart, child) => topping
                  .isProcessing &&
              product.isProcessing &&
              size.isProcessing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: MQuery.height! * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MQuery.width! * 0.3,
                        child: Image.asset(
                            "assets/" + product.getProductModel.image),
                      ),
                      SizedBox(
                        width: MQuery.width! * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.getProductModel.name,
                              style: ConstantsText.titleStyle,
                            ),
                            // ignore: unnecessary_null_comparison
                            Text(
                              NumberFormat.decimalPattern()
                                  .format((size.getSizeValue.price -
                                      (size.getSizeValue.price *
                                          product.getProductModel.discount /
                                          100)))
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Đang cập nhật",
                              style: ConstantsText.descTitleStyle,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 11,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () => size
                                          .decreaseAmount(size.getSizeValue),
                                      icon: const Icon(Icons.remove, size: 11),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    size.getSizeValue.quantity.toString(),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 11,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () =>
                                        size.increaseAmount(size.getSizeValue),
                                    icon: const Icon(Icons.add, size: 11),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 32,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            size: 26,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MQuery.width! * 0.5,
                      child: Row(
                        children: List.generate(
                          size.sizeList.length,
                          (index) => Row(
                            children: [
                              Radio<DetailProductSizeModel>(
                                value: size.sizeList[index],
                                groupValue: size.getSizeValue,
                                onChanged: (val) {
                                  size.changeSizeValue(val!);
                                },
                              ),
                              Text(size.sizeList[index].name),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      // ignore: avoid_print
                      onPressed: () {
                        cart.addCart(
                          size.getSizeValue.id,
                          product.getProductModel.name,
                          product.getProductModel.image,
                          product.getProductModel.id,
                          (topping.totalPriceTopping +
                              size.getSizeValue.price -
                              (size.getSizeValue.price *
                                  product.getProductModel.discount /
                                  100)),
                          topping.selectToppingList,
                          size.getSizeValue.quantity,
                        );
                        topping.clearTopping();
                        Navigator.pop(context);
                      },
                      child: Text(
                        NumberFormat.decimalPattern()
                            .format(((topping.totalPriceTopping +
                                    size.getSizeValue.price -
                                    (size.getSizeValue.price *
                                        product.getProductModel.discount /
                                        100)) *
                                size.getSizeValue.quantity))
                            .toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
