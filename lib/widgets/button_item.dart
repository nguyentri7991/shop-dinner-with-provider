import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Function() onTap;
  final Color buttonColor, borderColor;
  final double buttonHeight, buttonWidth;
  final TextStyle textStyle;

  const CustomButton(
      {Key? key,
      required this.buttonName,
      required this.onTap,
      required this.buttonColor,
      required this.borderColor,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.width * buttonHeight,
        width: MediaQuery.of(context).size.width * buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
          color: buttonColor,
        ),
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
