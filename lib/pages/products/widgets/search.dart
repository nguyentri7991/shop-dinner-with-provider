import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String? text;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  const SearchWidget({Key? key, this.text, this.onChanged, this.hintText})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final styleActive = TextStyle(color: Colors.black);
    // ignore: prefer_const_constructors
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text!.isEmpty ? styleActive : styleHint;
    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextField(
        controller: controlller,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: style.color,
            size: 20,
          ),
          suffixIcon: widget.text!.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controlller.clear();
                    widget.onChanged!("");
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
