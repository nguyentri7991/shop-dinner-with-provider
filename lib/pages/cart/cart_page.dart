import 'package:flutter/material.dart';
import '../cart/widgets/body.dart';
import '../cart/widgets/header.dart';

showCartModel(context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderCart(),
            BodyCart(),
          ],
        ),
      );
    },
  );
}
