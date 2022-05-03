import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color kPrimaryColor = HexColor('#53B175');
final Color kShadowColor = HexColor('#A8A8A8');
final Color blackColor = HexColor('#181725');
final Color kSubtitleColor = HexColor('#7C7C7C');
final Color kSecondaryColor = HexColor('#F2F3F2');
final Color kBorderColor = HexColor('#E2E2E2');

class ConstantsText {
  static final TextStyle titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: blackColor,
  );
  static final TextStyle secondTitleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.9),
  );
  static final TextStyle descTitleStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: Colors.grey.withOpacity(0.8),
  );
  static final TextStyle secondDescTitleStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.8),
  );
  static final TextStyle priceTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.brown.withOpacity(0.9),
  );
  static final TextStyle descPriceTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: Colors.brown.withOpacity(0.9),
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.black,
    decorationStyle: TextDecorationStyle.solid,
  );
  static final TextStyle sectionTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.8),
  );
}
