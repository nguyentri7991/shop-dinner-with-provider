import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/product_item.dart';
import '../../../helpers/api_product.dart';
import '../provider/product_pr.dart';

class BodyShopPage extends StatefulWidget {
  const BodyShopPage({Key? key}) : super(key: key);

  @override
  _BodyShopPageState createState() => _BodyShopPageState();
}

class _BodyShopPageState extends State<BodyShopPage> {
  _getProducts() async {
    var provider = Provider.of<ProductProvider>(context, listen: false);
    var response = await ProductService.getProducts();
    if (response.isSuccessful!) {
      provider.setProductList(response.data!);
    } else {
      // ignore: avoid_print
      print(response.message!);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    _getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, child) => product.isProcessing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: product.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          ProductItem(
                        id: product.productList[index].id,
                        name: product.productList[index].name,
                        image: product.productList[index].image,
                        price: product.productList[index].price,
                        sale: product.productList[index].discount,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
