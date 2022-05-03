import 'package:flutter/material.dart';
import './widgets/list_topping.dart';
import './widgets/section_select.dart';
import './widgets/header.dart';

showDialogFunc(context, id) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HearDetail(
                      productId: id,
                    ),
                    const SizedBox(height: 10),
                    const SectionSelect(
                      title: "Chọn Topping",
                    ),
                    const ToppingList(),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
