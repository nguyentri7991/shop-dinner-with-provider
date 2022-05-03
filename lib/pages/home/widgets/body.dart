import 'package:flutter/material.dart';
import '../../../resource/style_text.dart';
import '../widgets/banner_promotion.dart';
import '../../../helpers/api_promotion.dart';
import '../provider/promotion_pr.dart';
import 'package:provider/provider.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  _getPromotions() async {
    var provider = Provider.of<PromotionProvider>(context, listen: false);
    var response = await PromotionService.getPromotions();
    if (response.isSuccessful!) {
      provider.setPromotionList(response.data!);
    } else {
      // ignore: avoid_print
      print(response.message!);
    }
    provider.setIsProcessing(false);
  }

  @override
  void initState() {
    super.initState();
    _getPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PromotionProvider>(
      builder: (context, promotion, child) => promotion.isProcessing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Khuyến mãi",
                      style: ConstantsText.titleStyle,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          promotion.getAmountPromotion,
                          (index) => PromotionBanner(
                            image: "assets/image/khuyenmai1.jpg",
                            title: promotion.getPromotionList[index].name,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Tin Tức",
                      style: ConstantsText.titleStyle,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
