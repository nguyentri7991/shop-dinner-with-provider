import 'package:flutter/material.dart';
import '../products/widgets/bottom.dart';
import '../products/widgets/body.dart';
import '../../resource/mq.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MQuery().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          "Sản Phẩm",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const BodyShopPage(),
      bottomNavigationBar: const BottomNavigationShopPage(),
    );
  }
}
