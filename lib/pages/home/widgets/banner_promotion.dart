import 'package:flutter/material.dart';
import '../../../resource/style_text.dart';

class PromotionBanner extends StatelessWidget {
  final String image;
  final String title;

  const PromotionBanner({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.72,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(image),
          ),
          Text(
            title,
            style: ConstantsText.secondTitleText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
